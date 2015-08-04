FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    sequence(:date_of_birth)  { |n| "201#{n}-08-09" }
    sequence(:country) { |n| "Ukraine_#{n}"}
    sequence(:city)  { |n| "Vinnytsia_#{n}" }
    sequence(:address) { |n| "Zankovetska_#{n}"}
    password  "foobar"
  end
end