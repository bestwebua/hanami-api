RSpec.describe PasswordDigest do
  it { expect(described_class).to be < BCrypt::Password }
end
