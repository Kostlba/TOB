class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :fullname
      t.string :adress
      t.integer :status_id
      t.string :why

      t.timestamps
    end
  end
end
