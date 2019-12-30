class CreatePokemonsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :type_id
      t.string :move
      t.integer :max_hp
    end
  end
end
