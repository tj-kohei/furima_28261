FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { password }
    password_confirmation { password }
  end
  factory :profile do
    birthday {Faker::Date}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    first_name_kana {Faker::Name.first_name}
    last_name_kana {Faker::Name.last_name}
    
  end
end