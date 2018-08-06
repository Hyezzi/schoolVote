class AddTitle2ToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :title2, :string
  end
end