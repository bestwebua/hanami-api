class AccountRepository < Hanami::Repository
  def by_email(email)
    accounts.where(email: email).first
  end
end
