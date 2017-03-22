FactoryGirl.define do
  factory :user do
    email "hung@yopmail.com"
    password "password"
  end

  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end
end