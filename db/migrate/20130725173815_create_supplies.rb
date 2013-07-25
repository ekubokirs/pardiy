class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
    	t.references :event
    	t.string :supply



      t.timestamps
    end
  end
end
