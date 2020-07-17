FactoryBot.define do
  
  factory :user do
    username { Faker::Name.name  }
    email { Faker::Internet.email }
    password { "123456"}
    password_confirmation { "123456" }
  end

  factory :admin , parent: :user do
    role { "admin" }
  end
end