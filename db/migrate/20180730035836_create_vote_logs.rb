class CreateVoteLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :vote_logs do |t|
      t.string :studentID
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
