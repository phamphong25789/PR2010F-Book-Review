class User < ApplicationRecord
	has_many :reviews
	has_many :comments
	has_many :favorites
	has_many :rates

	before_save :downcase_email
	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

  class << self
    def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end
  end

  def current_user?(user)
    user && user == self
  end
  
	private
	def downcase_email
		self.email = email.downcase
	end
end
