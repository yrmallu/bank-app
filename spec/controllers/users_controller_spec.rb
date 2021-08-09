require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    before do
      get :new
    end

    it 'is expected to assign user as new instance variable' do
      expect(assigns[:user]).to be_instance_of(User)
    end

    it 'renders new template' do
      is_expected.to render_template(:new)
    end

    it 'renders application layout' do
      is_expected.to render_template(:application)
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    before do
      get :show, params: { id: user.id }
    end

    it 'is expected to assign user as new instance variable' do
      expect(assigns[:user]).to be_instance_of(User)
    end

    it 'renders new template' do
      is_expected.to render_template(:show)
    end

    it 'renders application layout' do
      is_expected.to render_template(:application)
    end
  end


  describe 'POST #create' do
    before do
      post :create, params: params
    end
    context 'with valid attributes' do
      let(:params) { { user: { email: 'yedu@gmail.com', password: '12345678', password_confirmation: '12345678', name: 'Reddy' } } }
      # before do
      #   post :create, params: { user: { email: 'yedu@gmail.com', password: '12345678', password_confirmation: '12345678', name: 'Reddy' } }
      # end
      it 'is expected to create new user successfully' do
        expect(assigns[:user]).to be_instance_of(User)
      end

      it 'is expected to have name assigned to it' do
        expect(assigns[:user].name).to eq('Reddy')
      end

      it 'is expected to redirect to users path' do
        is_expected.to redirect_to User.last
      end

      it 'is expected to set flash message' do
        expect(flash[:success]).to eq('Welcome to the Banking App! Your account has been created')
      end
      # specify { expect(response).to have_http_status(:success) }
    end

    context 'when params are not correct' do
      let(:params) { { user: { name: '' } } }

      it 'is expected to render new template' do
        is_expected.to render_template(:new)
      end

      it 'is expected to add errors to name attribute' do
        expect(assigns[:user].errors[:name]).to eq(['can\'t be blank'])
      end
    end
    # context 'with invalid email' do
    #   before do
    #     post :create, params: { session: { email: 'invalid@gmail.com', password: user.password } }
    #   end
    #   specify { expect(response).to render_template('new') }
    #   specify { expect(session[:user_id]).to be_nil }
    # end
    #
    # context 'with invalid password' do
    #   before do
    #     post :create, params: { session: { email: user.email, password: '1234' } }
    #   end
    #   specify { expect(response).to render_template('new') }
    #   specify { expect(session[:user_id]).to be_nil }
    # end
  end

end