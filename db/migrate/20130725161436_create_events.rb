class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :venue
      t.string :event_type
      
      t.references :user

      t.timestamps
    end
  end
end
