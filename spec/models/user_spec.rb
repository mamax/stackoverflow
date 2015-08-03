require 'rails_helper'
require 'spec_helper'

describe User do

  # let(:found_user) { User.find_by(email: @user.email) }

  before { @user = User.new(name: "Example User", email: "user@example.com", date_of_birth: "2012-08-09", country: "Ukraine", city: "Vinnytsia", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  #presense of element objects
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:date_of_birth) }
  it { should respond_to(:country) }
  it { should respond_to(:city) }
  it { should respond_to(:address) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should respond_to(:authenticate) }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too short" do
    before { @user.name = "a" * 2 }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when country is not present" do
    before { @user.country = " " }
    it { should_not be_valid }
  end

  describe "when city is not present" do
    before { @user.city = " " }
    it { should_not be_valid }
  end

  describe "when date of birth is not present" do
    before { @user.date_of_birth = " " }
    it { should_not be_valid }
  end

  describe "when address is not present" do
    before { @user.address = " " }
    it { should_not be_valid }
  end

  describe "when email format is valid" do
    before do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
      it { should be_valid }
    end
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  #tests for password
  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com", date_of_birth: "2012-08-09", country: "Ukraine", city: "Vinnytsia", password: "foobar", password_confirmation: "foobar")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
end
