class User < ApplicationRecord
    has_secure_password validation: false
    has_many :comments
end
