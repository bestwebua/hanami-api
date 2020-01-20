require 'hanami/interactor'

class RegisterAccount
  include Hanami::Interactor

  expose :account

  attr_reader :account, :account_repository, :password_generator_service

  def initialize(repository:, password_generator_service:)
    @account_repository, @password_generator_service = repository, password_generator_service
  end

  def call(params)
    @account ||= account_repository.create(
      account_params_with_password_digest(params)
    )
  end

  private

  def encrypted_password(password)
    password_generator_service.create(password)
  end

  def account_params_with_password_digest(account_params)
    {
      email: account_params[:email],
      password_digest: encrypted_password(account_params[:password]),
    }
  end
end
