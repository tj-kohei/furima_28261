FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)
    nickname {"あつし"}
    last_name{"愛う"}
    first_name{"え岡"}
    last_name_kana{"アイウ"}
    first_name_kana{"エオカ"}
    email { Faker::Internet.free_email }
    birthday {"1998-05-04"}
    password { password }
    password_confirmation { password }
  end

  
end