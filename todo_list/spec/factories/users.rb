FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com" }
    first_name 'John'
    last_name 'Smith'
    username 'jsmith'
    password 'qwertyqwerty'
    password_confirmation { |u| u.password }
  end
end
