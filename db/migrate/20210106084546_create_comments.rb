class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :review_id
      t.integer :user_id
      t.text :content
      t.belongs_to :targetable, polymorphic: true

      t.timestamps
    end
    add_index :comments, :targetable_id
    add_index :comments, :targetable_type
  end
end
