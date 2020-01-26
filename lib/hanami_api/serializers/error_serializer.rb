class ErrorSerializer
  def initialize(object)
    @object = object
  end

  def serialized_json
    object.to_json
  end

  private

  attr_reader :object
end
