RSpec.describe AccountRepository, type: :repository do
  describe '#by_email' do
    subject(:query) { described_class.new.by_email(target_email) }

    let(:email) { FFaker::Internet.email }
    let!(:account) { create(:account, email: email) }

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
end
