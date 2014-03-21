class User < ActiveRecord::Base
	#length, presence and format validation for user details
	validates :name, presence: true, length: { maximum: 15 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }
    validates :password_confirmation, length: { minimum: 6 }
end
