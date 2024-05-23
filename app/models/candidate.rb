class Candidate < ApplicationRecord
  has_one_attached :photo
  belongs_to :nomination
  has_many :votes
  has_many :users, through: :votes

  translates :title, :description, fallbacks_for_empty_translations: true
  globalize_accessors

  accepts_nested_attributes_for :translations

  validates :title, presence: true
  validates :description, presence: true
  #validates :photo, presence: true

  def self.ransackable_associations(auth_object = nil)
    %w[votes users translations nomination]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[img nomination_id translations_id]
  end
end
