class AddTargetableTypeToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :targetable_type, :string
  end
end
