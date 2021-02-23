class Book < ApplicationRecord
	has_one_attached :image
	belongs_to :category
	belongs_to :author
	has_many :favorites
	has_many :rates
	has_many :reviews
	validates :category_id, presence: true 
	validates :author_id, presence: true
	validates :name, presence: true
	validates :description, presence: true
	validates :image, content_type: { 
		in: %w[image/jpeg image/gif image/png], 
		message: "must be a valid image format" },
		size: { less_than: 5.megabytes, 
			message: "should be less than 5MB" }
	# Returns a resized image for display.
	def display_image
		image.variant(resize_to_limit: [250, 357])
	end
end