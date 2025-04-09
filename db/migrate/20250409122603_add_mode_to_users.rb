class AddModeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :mode, :string
  end
end
