class CreateHoowons < ActiveRecord::Migration[5.0]
  def change
    create_table :hoowons do |t|
      t.string :name
      t.string :given

      t.timestamps
    end
  end
end
