RSpec.describe CreateAccount do
  subject(:operation) { described_class.new(dependencies) }

  let(:repository) { instance_double('AccountRepository') }
  let(:password_generator_service) { class_double('PasswordGeneratorService') }
  let(:dependencies) { { repository: repository, password_generator_service: password_generator_service } }

  it { expect(operation).to be_a(Hanami::Interactor) }

  describe '#call' do
    subject(:result) { operation.call(account_params) }

    let(:account_params) { attributes_for(:account) }
    let(:encrypted_password) { 'secure_password' }
    let(:user_params_with_password_digest) { { email: account_params[:email], password_digest: encrypted_password } }
    let(:account) { instance_double('Account') }

    describe 'operation successful' do
      context 'when email uniq' do
        it 'creates new account with encrypted password' do
          allow(repository).to receive(:email_exists?).and_return(false)
          expect(password_generator_service).to receive(:create).with(account_params[:password]).and_return(encrypted_password)
          expect(repository).to receive(:create).with(user_params_with_password_digest).and_return(account)
          expect(result.account).to eq(account)
          expect(result).to be_successful
        end
      end
    end

    describe 'operation failure' do
      context 'when email not uniq' do
        it 'addes operation error' do
          allow(repository).to receive(:email_exists?).and_return(true)
          expect(result.errors).to eq(['Email not uniq'])
          expect(result.account).to be_nil
          expect(result).to be_failure
        end
      end
    end
  end
end
