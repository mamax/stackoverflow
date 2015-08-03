class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { in: 3..20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :date_of_birth, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :password, length: { minimum: 6 }

  has_secure_password
end
