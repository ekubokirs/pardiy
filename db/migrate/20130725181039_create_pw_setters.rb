class CreatePwSetters < ActiveRecord::Migration
  def change
    create_table :pw_setters do |t|

      t.timestamps
    end
  end
end
