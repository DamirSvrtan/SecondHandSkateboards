class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :phone_number, :county
	has_secure_password
	has_many :decks, dependent: :destroy
	before_save { |user| user.email = email.downcase }
	before_save :create_remeber_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 3 }		
	validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :format => { :with => VALID_EMAIL_REGEX }
	validates :password, :presence => true, :length => { :minimum => 5 }
	validates :password_confirmation, presence: true
	validates :phone_number, :presence => true
	validates :county, :presence => true
	
	private

		def create_remeber_token
			self.remeber_token = SecureRandom.urlsafe_base64
		end

end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null