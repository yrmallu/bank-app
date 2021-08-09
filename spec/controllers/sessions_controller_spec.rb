require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user) { create(:user) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid username and password' do
      before do
        post :create, params: { session: { email: user.email, password: user.password } }
      end
      specify { expect(response).to redirect_to(user) }
      specify { expect(session[:user_id]).to eq(user.id) }
    end

    context 'with invalid email' do
      before do
        post :create, params: { session: { email: 'invalid@gmail.com', password: user.password } }
      end
      specify { expect(response).to render_template('new') }
      specify { expect(session[:user_id]).to be_nil }
    end

    context 'with invalid password' do
      before do
        post :create, params: { session: { email: user.email, password: '1234' } }
      end
      specify { expect(response).to render_template('new') }
      specify { expect(session[:user_id]).to be_nil }
    end
  end

end