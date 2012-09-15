class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :phone_number, :county
	has_secure_password

	has_many :decks, dependent: :destroy
        has_many :wheels, dependent: :destroy
	has_many :trucks, dependent: :destroy
	has_many :skates, dependent: :destroy
        has_many :skate_ostalos, dependent: :destroy
	has_many :hats, dependent: :destroy
        has_many :shoes, dependent: :destroy
        has_many :garments, dependent: :destroy
        has_many :clothing_ostalos, dependent: :destroy


	before_save { |user| user.email = email.downcase }
	before_save :create_remeber_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 3 }		
	validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :format => { :with => VALID_EMAIL_REGEX }
	validates :password, :presence => true, :length => { :minimum => 5 }
	validates :password_confirmation, presence: true
	validates :phone_number, :presence => true
	validates :county, :presence => true

	def send_password_reset
  		generate_token(:password_reset_token)
  		self.password_reset_sent_at = Time.zone.now
  		save!(:validate => false)
  		UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
    			self[column] = SecureRandom.urlsafe_base64
	end


	
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
