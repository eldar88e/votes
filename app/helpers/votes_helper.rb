module VotesHelper
  def votes_exists?(id)
    Vote.exists?(nomination_id: id, user_id: current_user&.id)
  end

  def vote_result(id)
    @votes = Vote.where(nomination_id: id)
  end

  def count_percent(id)
    @size_votes = @votes.count { |i| i.candidate_id == id }
    @size_votes.size.zero? ? 0 : (@size_votes / (@votes.size * 1.00) * 100).round(2)
  end
end
