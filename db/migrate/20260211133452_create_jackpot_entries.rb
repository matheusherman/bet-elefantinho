class CreateJackpotEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :jackpot_entries do |t|
      t.references :jackpot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :amount, null: false
      t.integer :number, array: true, null: false

      t.timestamps
    end
  end
end
