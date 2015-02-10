class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :prize_id
      t.integer :amount

      t.timestamps null: false
    end

    add_index :bids, [:user_id, :prize_id], unique: true
    add_index :bids, [:prize_id, :amount], unique: true
  end
end
