class CreateSchoolDbs < ActiveRecord::Migration[5.0]
  def change
    create_table :school_dbs do |t|
      t.string :studentID
      t.string :name

      t.timestamps
    end
  end
end
