class AddRespondsToToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :responds_to, :string
  end
end
