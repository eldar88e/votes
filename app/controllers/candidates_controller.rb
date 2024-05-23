class CandidatesController < ApplicationController
  before_action :authenticate_user!
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      title_desc = candidate_translate_params
      other_locales.each do |locale|
        next if title_desc["title_#{locale}"].blank? && title_desc["description_#{locale}"].blank?

        @candidate.translations.create(locale: locale, title: title_desc["title_#{locale}"],
                                       description: title_desc["description_#{locale}"])
      end
      redirect_to root_path, notice: 'Candidate was successfully created.'
    else
      # render :new

      respond_to do |format|
        # format.html { redirect_to root_path, notice: 'Candidate was successfully created.' }
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:error_candidate,
                                                   partial: '/partials/error',
                                                   locals: { model: @candidate })
        end
      end
    end
  end

  private

  def other_locales
    I18n.available_locales - [:en]
  end

  def global_title_desc
    other_locales.map { |loc| ["title_#{loc}".to_sym, "description_#{loc}".to_sym] }.flatten
  end

  def candidate_translate_params
    params.require(:candidate).permit(*global_title_desc)
  end

  def candidate_params
    params.require(:candidate).permit(:title, :description, :photo, :nomination_id)
  end
end
