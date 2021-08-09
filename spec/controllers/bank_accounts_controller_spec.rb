require 'rails_helper'

RSpec.describe BankAccountsController, type: :controller do

  describe 'GET #show' do
    let(:bank_account) { create(:bank_account) }
    before do
      get :show, params: { id: bank_account.id }
    end

    it 'is expected to assign user as new instance variable' do
      expect(assigns[:bank_account]).to be_instance_of(BankAccount)
    end

    it 'renders new template' do
      is_expected.to render_template(:show)
    end

    it 'renders application layout' do
      is_expected.to render_template(:application)
    end
  end

end
