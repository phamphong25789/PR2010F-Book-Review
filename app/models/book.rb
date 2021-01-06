class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :favorite
  has_many :rates
  has_many :reviews

end
