class AddS3ToVoteLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :vote_logs, :image, :string
  end
end
