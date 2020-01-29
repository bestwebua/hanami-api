RSpec.describe Api::Serializers::Account do
  it { expect(described_class).to be < Api::Serializers::ApplicationSerializer }
end
