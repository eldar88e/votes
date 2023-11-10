class SmsVerification < ApplicationRecord
  before_save :normalize_phone
  belongs_to :user

  validates :phone, presence: true
  validates :user_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["code", "created_at", "phone", "status", "updated_at", "user_id"]
  end

  private

  def normalize_phone
    self.phone = phone.scan(/\d/).join('')
  end
end
