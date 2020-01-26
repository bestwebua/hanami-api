module Api
  module Controllers
    module Accounts
      class Contract < Api::Action::Params
        params do
          required(:account).schema do
            required(:email).filled(:str?, format?: /.+@.+/)
            required(:password).filled(:str?)
            required(:password_confirmation).filled(:str?)
            rule(passwords_match: [:password, :password_confirmation]) { |p1, p2| p1.eql?(p2) }
          end
        end
      end
    end
  end
end
