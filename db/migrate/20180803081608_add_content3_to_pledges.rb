class AddContent3ToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :content3, :text
  end
end
