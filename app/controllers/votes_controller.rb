class VotesController < ApplicationController
  before_action :user_signed_in?, only: :create
  before_action :nominations_candidates, only: [:index, :create]
  before_action :check_required_param, only: :create

  def index
    @vote = Vote.new
  end

  def create
    p data  = { user_id: current_user.id, candidate_id: vote_params['candidate_id'].to_i }
    if Vote.create(data)
      nomination_id = Candidate.find_by(id: data[:candidate_id]).nomination_id
      nomination = Nomination.find_by(id: nomination_id).title
      redirect_to root_path, notice: "Вы успешно проглосовали за номинацию #{nomination} года!"
    else
      render :new, alert: 'Вы не смогли проголосовать.'
    end
  rescue ActiveRecord::RecordNotUnique => e
    redirect_to root_path, alert: "#{e}"
  end

  private

  def vote_params
    params.require(:vote).permit(:candidate_id)
  end

  def check_required_param
    unless params.key?(:vote)
      redirect_to root_path, alert: "Вы не выбрали кандидата!"
    end
  end

  def nominations_candidates
    @nominations ||= Nomination.includes(:candidates)
  end
end
