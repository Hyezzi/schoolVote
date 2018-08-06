class RemoveLogFromSchoolDb < ActiveRecord::Migration[5.0]
  def change
    remove_reference :school_dbs, :log, foreign_key: true
  end
end
