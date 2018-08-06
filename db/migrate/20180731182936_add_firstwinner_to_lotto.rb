class AddFirstwinnerToLotto < ActiveRecord::Migration[5.0]
  def change
    add_column :lottos, :firstwinner, :string
  end
end
