class AddTitle3ToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :title3, :string
  end
end
