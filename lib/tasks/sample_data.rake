namespace :db do
  desc "Fill database with sample data"
  task fill_db: :environment do
    make_users
    make_microposts
    make_relationships
  end
end
def make_users
  admin = User.create!(name: "Admin",
                       email: "example@railstutorial.org",
                       date_of_birth: "2003-08-08",
                       country: "Ukraine",
                       city: "Vinnitsa",
                       address: "Zankovetska",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)

  moderator = User.create!(name: "Moderator",
                           email: "moderator@railstutorial.org",
                           date_of_birth: "2003-08-09",
                           country: "Ukraine1",
                           city: "Vinnitsa1",
                           address: "Zankovetska1",
                           password: "foobar",
                           password_confirmation: "foobar",
                           moderator: true)
    9.times do |n|
      name  = "User-#{n+1}"
      email = "exampl-#{n+1}@railstutorial.org"
      date_of_birth = "1993-08-08"
      country = "Ukraine-#{n+1}"
      city = "Vinitsa-#{n+1}"
      address = "Zankoveska-#{n+1}"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   date_of_birth: date_of_birth,
                   country: country,
                   city: city,
                   address: address,
                   password: password,
                   password_confirmation: password)

    end
end


  def make_microposts
      users = User.all
      #(limit: 6)
    9.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end

  def make_relationships
      users = User.all
      user = users.first
      followed_users = users[2..9]
      followers = users[3..5]
      followed_users.each { |followed| user.follow!(followed) }
      followers.each      { |follower| follower.follow!(user) }
  end