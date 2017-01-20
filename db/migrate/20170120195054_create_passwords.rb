class CreatePasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :passwords do |t|
      t.string :user_inputs, array: true
      t.string :combinations, array: true

      t.timestamps
    end
  end
end
