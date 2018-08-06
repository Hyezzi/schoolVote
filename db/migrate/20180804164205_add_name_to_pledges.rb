class AddNameToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :name, :string
  end
end
