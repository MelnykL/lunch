FactoryBot.define do
  
  factory :menu_item do
    name { Faker::Name.name  }
    price { 10 }
    course { "one"}
  end
end