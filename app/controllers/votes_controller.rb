class VotesController < ApplicationController
  before_action :user_signed_in?, only: :create

  def index
    @vote = Vote.new
    @nominations = Nomination.includes(:candidates)
  end

  def create
    return flash.now[:alert] = "Вы не выбрали кандидата!" unless check_required_param

    data = { user_id: current_user.id,
             candidate_id: vote_params['candidate_id'].to_i,
             nomination_id: vote_params['nomination_id'].to_i }
    if Vote.create(data)
      #nomination_id = Candidate.find_by(id: data[:candidate_id]).nomination_id
      nomination = Nomination.find_by(id: vote_params[:nomination_id]).title
      #redirect_to root_path, notice: "Вы успешно проглосовали за номинацию #{nomination} года!"
      flash.now[:notice] = "Вы успешно проглосовали за номинацию #{nomination} года!"
    else
      flash.now[:alert] = 'Вы не смогли проголосовать.'
      #render :index, alert: 'Вы не смогли проголосовать.'
    end
  rescue ActiveRecord::RecordNotUnique => e
    flash.now[:alert] = "#{e}"
  end

  private

  def vote_params
    params.require(:vote).permit(:candidate_id, :nomination_id)
  end

  def check_required_param
    vote_params.key?(:candidate_id)
  end
end
