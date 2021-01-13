class Book < ApplicationRecord
	has_one_attached :image
  belongs_to :category
  belongs_to :author
  has_many :favorites
  has_many :rates
  has_many :reviews
end
