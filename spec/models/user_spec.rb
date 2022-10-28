require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    
  #needs password and password confirmation, should also match
  context "given matching entries for password and password confirmation" do
    it "validates the user" do
      @user = User.new(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
      expect(@user).to be_valid
    end
  end

  #need unique email
  context "given a unique email" do
    it "validates the user" do
      @user = User.create(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
      @user2 = User.new(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
      @user3 = User.new(email: "anothertest@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
      expect(@user2).to_not be_valid
      expect(@user3).to be_valid
    end
  end

  #minimum password length
  context "given a password greater than 10 characters" do
    it "validates the user" do
      @user = User.create(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
      expect(@user).to be_valid
    end
  end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

  end
end
