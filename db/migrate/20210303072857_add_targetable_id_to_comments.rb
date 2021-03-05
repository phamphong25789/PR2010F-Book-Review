class AddTargetableIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :targetable_id, :integer
  end
end
