module Utils
  module RespondWith
    def respond_with(http_status, object)
      status(http_status, object.to_json)
    end
  end
end
