module Utils
  module RespondWith
    def respond_with(http_status, object, serializer = ErrorSerializer)
      status(http_status, serializer.new(object).serialized_json)
    end
  end
end
