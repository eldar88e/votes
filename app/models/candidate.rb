class Candidate < ApplicationRecord
  belongs_to :nomination
  has_many :votes
  has_many :users, :through => :votes
end
