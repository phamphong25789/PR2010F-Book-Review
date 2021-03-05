class RemoveColFavoriteTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :integer
    remove_column :favorites, :author_id
  end
end
