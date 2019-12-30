class CreateTypesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :element
    end
  end
end
