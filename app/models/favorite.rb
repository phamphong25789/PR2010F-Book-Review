class Favorite < ApplicationRecord
  has_many :books
  has_many :authors
  belongs_to :user
end
