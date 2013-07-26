class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
    	t.string :supply
    	t.string :amount

    	t.references :event

      t.timestamps
    end
  end
end
