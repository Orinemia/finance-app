class AddLocationToFinances < ActiveRecord::Migration
  def change
    add_column :finances, :location, :string
  end
end
