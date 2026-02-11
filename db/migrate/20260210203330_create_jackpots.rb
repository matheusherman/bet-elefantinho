class CreateJackpots < ActiveRecord::Migration[8.1]
  def change
    create_table :jackpots do |t|
      t.string :status, null: false
      t.decimal :total_amount, null: false
      t.datetime :draw_at, null: false
      t.timestamps
    end
  end
end
