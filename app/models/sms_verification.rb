class SmsVerification < ApplicationRecord
  before_save :normalize_phone
  belongs_to :user

  validates :phone, presence: true
  validates :user_id, presence: true

  private

  def normalize_phone
    self.phone = phone.scan(/\d/).join('')
  end
end
