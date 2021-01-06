class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :author_id
      t.integer :category_id
      t.text :description

      t.timestamps
    end
  end
end
