require_relative '../../serializers/account'

module Api
  module Controllers
    module Accounts
      class Signup
        include Api::Action
        include Utils::RespondWith

        params Api::Controllers::Accounts::Contract

        def initialize(operation = CreateAccount.new)
          @operation = operation
        end

        def call(params)
          return respond_with(422, params.errors) unless params.valid?

          result = operation.call(params[:account])
          return respond_with(422, result.errors) unless result.successful?

          respond_with(201, result.account, Api::Serializers::Account)
        end

        private

        attr_reader :operation
      end
    end
  end
end
