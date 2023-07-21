class Nomination < ApplicationRecord
  has_many :candidates, dependent: :destroy
end
