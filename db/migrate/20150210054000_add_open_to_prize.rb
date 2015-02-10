class AddOpenToPrize < ActiveRecord::Migration
  def change
    add_column :prizes, :open, :boolean, default: true
  end
end
