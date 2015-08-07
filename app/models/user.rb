class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  before_save { self.email = email.downcase }
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: { in: 3..20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :date_of_birth, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :password, length: { minimum: 6 }

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    microposts
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
