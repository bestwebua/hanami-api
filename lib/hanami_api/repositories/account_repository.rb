class AccountRepository < Hanami::Repository
  def by_email(email)
    accounts.where(email: email).first
  end

  def email_exists?(email)
    !!by_email(email)
  end
end
