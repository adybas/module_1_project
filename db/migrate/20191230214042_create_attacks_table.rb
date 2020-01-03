class CreateAttacksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :attacks do |t|
      t.string :move
      t.integer :move_damage, :default => 0
    end
  end
end
