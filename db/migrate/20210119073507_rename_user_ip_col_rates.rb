class RenameUserIpColRates < ActiveRecord::Migration[6.1]
  def change
    rename_column :rates, :user_ip, :user_id
  end
end
