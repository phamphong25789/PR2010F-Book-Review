class Favorite < ApplicationRecord
  belongs_to :book
  belongs_to :author
  belongs_to :user
end