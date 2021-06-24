require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {User.create!(username: 'user1', password: 'password')}
  
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_length_of(:password).is_at_least(6)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_uniqueness_of(:session_token)}

    # describe "password setter" do 

      # it "should set up password_digest" do
      #   expect(user.password='password').to eq(BCrypt::Password.new.isPassword?('password'))
      # end

    # end

    describe "is_password? " do 
      let!(:user) {User.create!(username: 'user2', password: 'password')}

      context "valid_password" do
        it "should return true" do
          expect(user.is_Password?('password')).to be true
        end
      end

      context "invalid_password" do
        it "should return false" do
          expect(user.is_Password?('testing')).to be false
        end
      end

    end

    describe "reset_session_token!" do
      # user factory  
      let!(:user) {FactoryBot.create(:user)}
      #let!(:user) {User.create!(username: 'user2', password: 'password')}
      context "reset sucessfully" do
        it "should generate new token after reset" do
          old_token = user.session_token
          expect(user.reset_session_token!).to_not eq(old_token)
        end
      end
      
      context "reset failed" do
        it "should not generate new token after reset" do
          old_token = user.session_token
          expect(user.session_token).to eq(old_token)
        end
      end
    end

    describe "find by credentials" do
      let!(:user) { User.create( username: "user3", password: "password") }
      context "user found successfully " do
        it "should return user by the username " do
          expect(User.find_by_credentials("user3","password") ).to eq(user)
        end
      end

      context "user found failed " do
        it "should return nil " do
          expect(User.find_by_credentials("user4","password") ).to eq(nil)
        end
      end

    end
end
