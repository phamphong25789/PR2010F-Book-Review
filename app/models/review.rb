class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :comments
  scope :review_by, ->field_name, value {where("? LIKE ?", field_name, value)}

  class << self
    def search(search)
      if search
        @reviews = Review.review_by("content", "%" + search + "%")
      else
        @reviews = Review.all
      end
    end
  end
end
