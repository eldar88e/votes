class User < ApplicationRecord
  has_many :votes
  has_many :sms_verifications
  has_many :candidates, through: :votes
  has_many :nominations, through: :votes
  validates :phone, length: { minimum: 10, maximum: 13 }, format: { with: /\A\d+\z/, message: "only allows digits" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, presence: true, uniqueness: true

  def confirmed?
    self.status == true
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[email phone status]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[votes]
  end
end
