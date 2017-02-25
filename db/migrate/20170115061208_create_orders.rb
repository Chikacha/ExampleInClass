class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
