class Nomination < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :votes, dependent: :destroy
end
