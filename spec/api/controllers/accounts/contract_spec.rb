RSpec.describe Api::Controllers::Accounts::Contract do
  subject(:contract) { described_class.new(params) }

  let(:account_data) { attributes_for(:account, :with_password_confirmation) }
  let(:params) { { account: account_data } }

  describe 'contract successful' do
    context 'when no validation errors' do
      it 'valid contract' do
        expect(contract.valid?).to be(true)
        expect(contract.errors).to be_empty
      end
    end
  end

  describe 'contract failure' do
    shared_examples 'invalid contract' do
      it 'invalid contract' do
        expect(contract.valid?).to be(false)
        expect(contract.errors).to eq(errors)
      end
    end

    context 'when account key not exists' do
      let(:params) { account_data }
      let(:errors) { { account: ['is missing'] } }
      
      include_examples 'invalid contract'
    end

    context 'when account not an object' do
      let(:params) { { account: nil } }
      let(:errors) { { account: ['must be a hash'] } }
      
      include_examples 'invalid contract'
    end

    context 'when account required keys not exist' do
      let(:params) { { account: {} } }
      let(:errors) { { account: { email: ['is missing'], password: ['is missing'], password_confirmation: ['is missing'] } } }
      
      include_examples 'invalid contract'
    end

    context 'when account required keys are empty' do
      let(:params) { { account: { email: '', password: '', password_confirmation: '' } } }
      let(:errors) { { account: { email: ['must be filled'], password: ['must be filled'], password_confirmation: ['must be filled'] } } }
      
      include_examples 'invalid contract'
    end

    context 'when account required keys are not strings' do
      let(:params) { { account: { email: 1, password: 2, password_confirmation: 3 } } }
      let(:errors) { { account: { email: ['must be a string'], password: ['must be a string'], password_confirmation: ['must be a string'] } } }
      
      include_examples 'invalid contract'
    end

    context 'when email does not match regex pattern' do
      let(:params) { { account: { email: 'not_an_email', password: '123', password_confirmation: '123' } } }
      let(:errors) { { account: { email: ['is in invalid format'] } } }
      
      include_examples 'invalid contract'
    end

    context 'when password_confirmation does not match password' do
      let(:params) { { account: { email: 'i@mail.com', password: '123', password_confirmation: '567' } } }
      let(:errors) { { account: { password_confirmation: ['must be equal to 123'] } } }
      
      include_examples 'invalid contract'
    end
  end
end
