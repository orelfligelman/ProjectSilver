class AddInfoToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :streetnumber, :string
    add_column :addresses, :building, :string
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
    add_column :addresses, :zipcode, :integer
  end
end
