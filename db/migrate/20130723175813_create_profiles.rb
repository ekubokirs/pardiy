class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.date :birthdate
      t.string :city
      t.string :state
      t.text :bio

      t.timestamps
    end
  end
end
