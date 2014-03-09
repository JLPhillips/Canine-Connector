class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :age
      t.string :features
      t.text :unique_features
      t.boolean :is_lost
      t.boolean :is_found
      t.boolean :has_returned
      t.integer :hero_id
      t.date :date_found
      t.string :location

      t.timestamps
    end
  end
end
