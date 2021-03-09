class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :comments

#this is rely_coment working station - start
  has_many :comments, as: :targetable
#this is rely_coment working station - end

scope :review_by, ->field_name, value {where("#{field_name} LIKE ?", value)}
scope :autocomplete_search, ->field_name, value, value2 {where(
  "#{field_name} LIKE ? OR #{field_name} LIKE ?",
  value,
  value2
  )}

class << self
  def search(search)
    if search
      @reviews = Review.review_by("content", "%" + search + "%")
    else
      @reviews = Review.all
    end
  end

  def search_word(value)
    @reviews = Review.autocomplete_search("content", "% " + value + "%", value + "%")
  end
end
end