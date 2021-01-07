class Favorite < ApplicationRecord
  belong_to :book
  belong_to :author
  belongs_to :user
end