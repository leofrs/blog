class User < ApplicationRecord
    has_secure_password
    has_many :articles

    validates :name, presence: true
    validates :name_user, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
end
