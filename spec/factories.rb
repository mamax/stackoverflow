FactoryGirl.define do
  factory :user do
    name     "MichaeHartl"
    email    "michael@example.com"
    date_of_birth  "2012-08-09"
    country  "Ukraine"
    city  "Vinnytsia"
    address  "Zankovetska"
    password  "foobar"
  end
end