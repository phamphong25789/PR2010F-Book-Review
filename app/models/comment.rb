class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :review
	validates :content, presence: true

	scope :orderByDesc, -> { order(created_at: :desc) }
end
