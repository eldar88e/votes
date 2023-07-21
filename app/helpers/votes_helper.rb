module VotesHelper
  def votes_exists?(candidates)
    candidates_ids = candidates.pluck(:id)
    Vote.exists?(candidate_id: candidates_ids, user_id: current_user.id)
  end

  def vote_result(candidates)
    @votes = Vote.where(candidate_id: candidates.pluck(:id))
  end

  def size_current_votes(candidate_id)
    @size_votes = @votes.select { |i| i.candidate_id == candidate_id }.size
  end
end
