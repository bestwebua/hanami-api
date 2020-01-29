RSpec.describe AccountRepository, type: :repository do
  subject(:query) { described_class.new.public_send(method, target_email) }

  let(:email) { FFaker::Internet.email }
  let!(:account) { create(:account, email: email) }

  describe '#by_email' do
    let(:method) { :by_email }

    context 'when account with email exists' do
      let(:target_email) { email }

      it 'returns found account' do
        expect(query).to eq(account)
      end
    end

    context 'when account with email not exists' do
      let(:target_email) { 'not_existing@email.com' }

      it { expect(query).to be_nil }
    end
  end

  describe '#email_exists?' do
    let(:method) { :email_exists? }
    
    context 'when account with email exists' do
      let(:target_email) { email }

      it 'returns found account' do
        expect(query).to be(true)
      end
    end

    context 'when account with email not exists' do
      let(:target_email) { 'not_existing@email.com' }

      it { expect(query).to be(false) }
    end
  end
end
