class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
    	t.string :chore


    	t.references :event

      t.timestamps
    end
  end
end
