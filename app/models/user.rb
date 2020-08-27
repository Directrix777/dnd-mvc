class User < ActiveRecord::Base
    has_secure_password
    has_many :characters
    validates_presence_of :username, :email, :password_digest

    def slug
        self.username.split(" ").join("-")
    end
    
    def self.find_by_slug(slug)
        self.find_by_username(slug.split("-").join(" "))
    end
end