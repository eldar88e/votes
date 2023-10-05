require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'POST #create' do
    let!(:candidate) { create(:candidate) }
    let!(:user) { create(:user) }

    context 'when authenticate user' do
      before { sign_in user }

      context 'when valid params' do
        it 'add new vote' do
          begin
            post :create, params: { vote: { candidate_id: Candidate.last.id, nomination_id: Nomination.last.id } }
          rescue ActionController::UnknownFormat
            nil
          end

          expect(Vote.all.size).to eq(1)
          expect(Vote.all[0].user_id).to eq(user.id)
          expect(Vote.all[0].candidate_id).to eq(Candidate.last.id)
          expect(Vote.all[0].nomination_id).to eq(Nomination.last.id)
        end
      end

      context 'when not valid params' do
        it 'add new vote' do
          begin
            post :create, params: { vote: { candidate_id: 9999, nomination_id: 9999 } }
          rescue ActionController::UnknownFormat
            nil
          end

          expect(Vote.all.size).to eq(0)
        end
      end
    end

    context 'when not authenticate user' do
      before { sign_out user }

      it 'no added vote' do
        post :create, params: { vote: { candidate_id: Candidate.last.id, nomination_id: Nomination.last.id } }
        expect(Vote.all.size).to eq(0)
      end
    end
  end
end
