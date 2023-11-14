class Candidate < ApplicationRecord
  belongs_to :nomination
  has_many :votes
  has_many :users, through: :votes

  translates :title, :description, fallbacks_for_empty_translations: true
  globalize_accessors

  def self.ransackable_associations(auth_object = nil)
    ["nomination", "users", "votes"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "img", "nomination_id", "title", "updated_at"]
  end
end
