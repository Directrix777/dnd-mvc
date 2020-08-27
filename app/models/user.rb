class User < ActiveRecord::Base
    has_secure_password
    has_many :characters
    validates_presence_of :username, :email, :password_digest
end