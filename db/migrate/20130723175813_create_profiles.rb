class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :birthdate
      t.string :city
      t.string :state
      t.text :bio

      t.timestamps
    end
  end
end