class Nomination < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :votes, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[title]
  end

  def self.ransackable_associations(auth_object = nil)
    ["candidates", "votes"]
  end
end
