class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :fish
      t.integer :birthdate
      t.text :bio

      t.timestamps
    end
  end
end
