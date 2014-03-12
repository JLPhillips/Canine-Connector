class AddColorsToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :main_color, :string
    add_column :dogs, :secondary_colors, :string
  end
end
