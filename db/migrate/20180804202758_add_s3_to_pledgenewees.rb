class AddS3ToPledgenewees < ActiveRecord::Migration[5.0]
  def change
    add_column :pledgenewees, :image, :string
    add_column :pledgenewees, :image2, :string
  end
end
