class CreateLottos < ActiveRecord::Migration[5.0]
  def change
    create_table :lottos do |t|
      t.integer :totalnum
      t.integer :winnum
      t.text :result

      t.timestamps
    end
  end
end
