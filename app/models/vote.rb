class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  def create(**args)
    if vote_exist?(args)
      raise ActiveRecord::RecordNotUnique.new 'Вы уже проголосовали за данную номинацию!'
    else
      super(**args)
    end
  end

  private

  def vote_exist?(**args)
    nomination_id = Candidate.find_by(id: args[:candidate_id]).nomination_id
    concurrent    = Nomination.includes(:candidates).where(nominations: { id: nomination_id })[0].candidates.pluck(:id)
    Vote.exists?(candidate_id: concurrent, user_id: create_user.id)
  end
end
