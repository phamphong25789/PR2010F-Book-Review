class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.integer :book_id
      t.integer :user_ip
      t.integer :star

      t.timestamps
    end
  end
end
