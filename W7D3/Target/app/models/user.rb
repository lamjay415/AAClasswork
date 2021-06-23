class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
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
end
