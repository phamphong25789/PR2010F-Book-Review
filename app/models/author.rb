class Author < ApplicationRecord
 has_many :favorites
 has_many :books
end
