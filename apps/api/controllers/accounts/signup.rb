require_relative '../../serializers/account'

module Api
  module Controllers
    module Accounts
      class Signup
        include Api::Action
        include Utils::RespondWith

        params Api::Controllers::Accounts::Contract

        def call(params)
          return respond_with(422, params.errors) unless params.valid?

          operation = CreateAccount.new.call(params[:account])
          return respond_with(422, operation.errors) unless operation.successful?

          respond_with(201, operation.account, Api::Serializers::Account)
        end
      end
    end
  end
end
