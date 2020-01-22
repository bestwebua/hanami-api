module Api
  module Controllers
    module Accounts
      class Signup
        include Api::Action
        include Utils::RespondWith
        
        params do
          required(:account).schema do
            required(:email).filled(:str?, format?: /.+@.+/)
            required(:password).filled(:str?)
            required(:password_confirmation).filled(:str?)
            rule(passwords_match: [:password, :password_confirmation]) { |p1, p2| p1.eql?(p2) }
          end
        end

        def call(params)
          return respond_with(422, params.errors) unless params.valid?

          operation = CreateAccount.new.call(params[:account])
          return respond_with(201, operation.account) if operation.successful?

          respond_with(422, operation.errors)
        end
      end
    end
  end
end
