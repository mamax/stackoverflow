namespace :db do
  desc "Fill database with sample data"
  # task populate: :environment do
  #   User.create!(name: "Example User",
  #                email: "exampl@railstutorial.org",
  #                date_of_birth: "2003-08-08",
  #                country: "Ukraine",
  #                city: "Vinnitsa",
  #                address: "Zankovetska",
  #                password: "foobar",
  #                password_confirmation: "foobar")
  #   10.times do |n|
  #     name  = "ExamplUser-#{n+1}"
  #     email = "exampl-#{n+1}@railstutorial.org"
  #     date_of_birth = "1993-08-08"
  #     country = "Ukraine-#{n+1}"
  #     city = "Vinitsa-#{n+1}"
  #     address = "Zankoveska-#{n+1}"
  #     password  = "password"
  #     User.create!(name: name,
  #                  email: email,
  #                  date_of_birth: date_of_birth,
  #                  country: country,
  #                  city: city,
  #                  address: address,
  #                  password: password,
  #                  password_confirmation: password)
  #   end
  # end

  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         date_of_birth: "2003-08-08",
                         country: "Ukraine",
                         city: "Vinnitsa",
                         address: "Zankovetska",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)


    end
end
