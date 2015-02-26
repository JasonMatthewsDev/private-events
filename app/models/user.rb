class User < ActiveRecord::Base
    has_many :events, foreign_key: 'creator_id'
    has_many :event_attendances, foreign_key: :attendee_id
    has_many :attended_events, through: :event_attendances
    
    before_save { self.username = username.downcase }
    
    validates :username, presence: :true
    validates :password, presence: :true
    
    has_secure_password
end
