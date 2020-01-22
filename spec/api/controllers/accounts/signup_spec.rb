RSpec.describe Api::Controllers::Accounts::Signup, type: :action do
  let(:action) { described_class.new }
  let(:params) { { account: { email: 'a@a', password: '1', password_confirmation: '1' } } }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
