class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  belongs_to :nomination
  validates :user_id, presence: true
  validates :candidate_id, presence: true
  validates :nomination_id, presence: true

  def self.create(args)
    if self.vote_exist?(args)
      raise ActiveRecord::RecordNotUnique.new 'Вы уже проголосовали за данную номинацию!'
    else
      super(args)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["candidate_id", "created_at", "id", "nomination_id", "updated_at", "user_id"]
  end

  private

  def self.vote_exist?(args)
    Vote.exists?(nomination_id: args[:nomination_id], user_id: args[:user_id])
  end
end
