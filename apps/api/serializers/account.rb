require_relative 'application_serializer'

module Api
  module Serializers
    class Account < ApplicationSerializer
      set_type :account

      attributes :email, :created_at
    end
  end
end
