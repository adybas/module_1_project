class CreatePokemonsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :type_id
      t.integer :attack_id
      t.integer :max_hp
    end
  end
end
