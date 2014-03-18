class User < ActiveRecord::Base
	#length, presence and format validation for user details
	validates :name, presence: true, length: { maximum: 15 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
