module Api
  module Controllers
    module Accounts
      class Contract < Api::Action::Params
        params do
          required(:account).schema do
            required(:email).filled(:str?, format?: /.+@.+/)
            required(:password).filled(:str?)
            required(:password_confirmation).filled(:str?)
            rule(password_confirmation: [:password, :password_confirmation]) { |p1, p2| p2.eql?(p1) }
          end
        end
      end
    end
  end
end
