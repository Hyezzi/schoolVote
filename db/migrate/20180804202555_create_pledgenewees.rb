class CreatePledgenewees < ActiveRecord::Migration[5.0]
  def change
    create_table :pledgenewees do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :title2
      t.text :content2
      t.string :title3
      t.text :content3

      t.timestamps
    end
  end
end
