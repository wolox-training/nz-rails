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
      let!(:book_suggestion) { create(:book_suggestion, user_id: user.id) }

      it 'creates a new book suggestion' do
        expect do
          post :create, params: { book_suggestion: {
            title: book_suggestion.title,
            author: book_suggestion.author,
            link: book_suggestion.link
          } }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: {
          title: book_suggestion.title,
          author: book_suggestion.author,
          link: book_suggestion.link
        } }
        expect(response).to have_http_status(:created)
      end
    end
  end

  context 'When creating an invalid book suggestion' do
    let!(:book_suggestion) { create(:book_suggestion, user_id: user.id) }

    before do
      post :create, params: { book_suggestion: {
        title: book_suggestion.title,
        author: book_suggestion.author
      } }
    end

    it 'doesn\'t create a new rent' do
      expect do
        post :create, params: { book_suggestion: {
          title: book_suggestion.title,
          author: book_suggestion.author
        } }
      end.to change { Rent.count }.by(0)
    end

    it 'responds with 400 status' do
      expect(response).to have_http_status(:bad_request)
    end
  end
end
