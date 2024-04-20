class User < ApplicationRecord
    has_secure_password
    has_many :articles

    validates :name, presence: true
    validates :name_user, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

    def generate_reset_password_token
        self.reset_password_token = SecureRandom.hex(20)
        self.reset_password_sent_at = Time.now
        save!
    end
end
