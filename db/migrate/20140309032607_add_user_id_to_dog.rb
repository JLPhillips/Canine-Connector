class AddUserIdToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :user_id, :integer
  end
end
