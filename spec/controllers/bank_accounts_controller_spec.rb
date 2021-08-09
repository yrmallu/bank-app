require 'rails_helper'

RSpec.describe BankAccountsController, type: :controller do

  describe 'GET #show' do
    it 'returns http success' do
      bank_account = create(:bank_account)
      get :show, params: { id: bank_account.id }
      expect(response).to have_http_status(:success)
    end
  end

end
