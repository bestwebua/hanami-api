RSpec.describe Api::Controllers::Accounts::Signup, type: :action do
  let(:response) { described_class.new.call(params)[0] }
  let(:account_data) { attributes_for(:account, :with_password_confirmation) }
  let(:params) { { account: account_data } }

  shared_examples 'returns http status' do
    it { expect(response).to eq(status) }
  end

  context 'when contract errors' do
    let(:status) { 422 }
    let(:account_data) { nil }

    include_examples 'returns http status'
  end

  context 'when operation errors' do
    let(:status) { 422 }

    before { create(:account, email: account_data[:email]) }

    include_examples 'returns http status'
  end

  context 'when no errors' do
    let(:status) { 201 }

    include_examples 'returns http status'
  end
end
