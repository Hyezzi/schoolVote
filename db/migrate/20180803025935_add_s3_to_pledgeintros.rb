class AddS3ToPledgeintros < ActiveRecord::Migration[5.0]
  def change
    add_column :pledgeintros, :image, :string
  end
end
