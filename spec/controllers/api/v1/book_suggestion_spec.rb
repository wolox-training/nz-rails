require 'rails_helper'

RSpec.shared_context 'Authenticated User' do
  let(:user) { create(:user) }
  let!(:access_data) { Api::V1::AuthenticationController.new.generate_access_token(user) }
  let!(:access_token) { access_data[:token] }
  let!(:renew_id) { access_data[:renew_id] }

  before do
    request.headers['Authorization'] = access_token
  end
end


describe Api::V1::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'


  describe 'POST #create' do
   context 'When creating a valid book suggestiont' do
     let!(:book_suggestion) { create(:book_suggestion,user_id: user.id)}

     it 'creates a new book suggestion' do
       expect do
         post :create, params: { id: user.id, rent: new_rent_attributes }
       end.to change { BookSuggestion.count }.by(1)
     end

     it 'responds with 201 status' do
       post :create, params: { id: user.id, rent: new_rent_attributes }
       expect(response).to have_http_status(:created)
     end
   end
end
