RSpec.describe Account, type: :entity do
  subject(:entity) { described_class.new(attributes) }

  let(:email) { FFaker::Internet.email }
  let(:password_digest) { FFaker::Internet.password }
  let(:attributes) { { email: email, password_digest: password_digest } }

  it 'can be initialized with attributes' do
    expect(entity.email).to eq(email)
    expect(entity.password_digest).to eq(password_digest)
  end
end
