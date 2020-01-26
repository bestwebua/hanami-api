RSpec.describe Api::Serializers::ApplicationSerializer do
  it { expect(described_class.ancestors).to include(FastJsonapi::ObjectSerializer) }
end
