class User < ApplicationRecord
  has_many :votes
  has_many :sms_verifications
  has_many :candidates, through: :votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, presence: true, uniqueness: true

  def confirmed?
    self.status == true
  end
end
