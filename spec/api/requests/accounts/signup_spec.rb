RSpec.describe 'Accounts', type: :request do
  describe 'POST #create' do
    before { post('/accounts/signup', params) }

    describe 'Success' do
      let(:params) { { account: attributes_for(:account, :with_password_confirmation) } }

      it 'renders new account' do
        expect(response).to be_created
        expect(resource_type(response)).to eq('account')
        expect(response).to match_json_schema('account')
      end
    end

    describe 'Failure' do
      let(:params) { {} }

      it 'renders errors' do
        expect(response).to be_unprocessable
        expect(response).to match_json_schema('error')
      end
    end
  end
end
