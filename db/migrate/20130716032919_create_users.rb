class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :fish
      t.string :salt
      t.string :code
      t.string :expires_at

      t.timestamps
    end
  end
end
