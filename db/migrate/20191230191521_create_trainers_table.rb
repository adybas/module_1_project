class CreateTrainersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :name
    end
  end
end
