FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Number.number(10)}
  end

  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end
end