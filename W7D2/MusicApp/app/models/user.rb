require 'bcrypt'
class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    after_initialize :ensure_session_token
    attr_reader :password

    def self.find_by_credentials(email, password)
        #find user by email and set to @user
        @user = User.find_by(email: email)
        #check if @user exists and password matches with is_password?
        #return user if both true or nil if false
        @user && @user.is_password?(password) ? @user : nil
    end

    def self.generate_session_token
        session_token = SecureRandom.urlsafe_base64
    end

    #set self session token to urlsafe_base64
    #save! self
    #return session token
    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    #set session token to urlsafe_base64 if nil
    #return session token
    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end

    #set password_digest to BCrypt password with password
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    #create bycrypt password object with password digest
    #call is_password? on password 
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
end
