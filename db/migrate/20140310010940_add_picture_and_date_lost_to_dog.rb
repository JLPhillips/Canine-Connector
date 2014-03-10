class AddPictureAndDateLostToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :picture, :string
    add_column :dogs, :date_lost, :date
  end
end
