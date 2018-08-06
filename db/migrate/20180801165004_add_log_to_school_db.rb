class AddLogToSchoolDb < ActiveRecord::Migration[5.0]
  def change
    add_reference :school_dbs, :log, foreign_key: true
  end
end
