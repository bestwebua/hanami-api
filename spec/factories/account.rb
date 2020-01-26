FactoryBot.define do
  factory :account, class: AccountRepository do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    password_confirmation { nil }

    trait :with_password_confirmation do
      password_confirmation { password }
    end
  end
end
