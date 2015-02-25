class User < ActiveRecord::Base
    before_save { self.username = username.downcase }
    
    validates :username, presence: :true
    validates :password, presence: :true
    
    has_secure_password
end
