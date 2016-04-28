class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :dob, :string
    add_column :users, :adres, :text
  end
end
