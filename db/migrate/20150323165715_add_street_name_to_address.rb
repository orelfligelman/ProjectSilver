class AddStreetNameToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :streetname, :string
  end
end
