class Todevise < ActiveRecord::Migration
  def change
  remove_column  :users, :password
  remove_column :users, :email
  end
end
