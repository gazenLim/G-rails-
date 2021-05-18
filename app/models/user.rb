class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: true, length: { minimum: 3, maximum: 25 }
    validates :username,  presence: true, length: { minimum: 5, maximum: 255 }

end
