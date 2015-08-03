require 'rails_helper'

require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com", date_of_birth: "2012-08-09", country: "Ukraine", city: "Vinnytsia") }

  subject { @user }

  #presense of element objects
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:date_of_birth) }
  it { should respond_to(:country) }
  it { should respond_to(:city) }
  it { should respond_to(:address) }


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

end
