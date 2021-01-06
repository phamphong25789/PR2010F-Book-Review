class Author < ApplicationRecord
 belongs_to :favorite
 has_many :books
end
