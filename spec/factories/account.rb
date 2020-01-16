FactoryBot.define do
  factory :account, class: AccountRepository do
    email { FFaker::Internet.email }
    password_digest { FFaker::Internet.password }
  end
end