class RemoveReviewIdFromComments < ActiveRecord::Migration[6.1]
  def change
  	remove_column :comments, :review_id
  end
end
