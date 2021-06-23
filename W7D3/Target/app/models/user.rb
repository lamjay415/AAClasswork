class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password, :password_digest, presence: true
    validates :password, length:{minimum:6, allow_nil: true}
    after_initialize :ensure_session_token

    attr_reader :password
    def password=(password)
        @password=password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def is_Password?(password)
        password_obj = BCrypt::Password.new(self.password_digest)
        password_obj.is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_Password?(password)
            user
        else
            nil
        end
    end
end
