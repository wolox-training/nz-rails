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



describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    context 'When fetching the book index' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :index, params: { id: user.id }
      end

      it 'responses with the users books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
