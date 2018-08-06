class AddS32ToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :image2, :string
  end
end
