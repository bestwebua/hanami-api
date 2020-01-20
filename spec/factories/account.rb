FactoryBot.define do
  factory :account, class: AccountRepository do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    password_digest { password }
  end
end