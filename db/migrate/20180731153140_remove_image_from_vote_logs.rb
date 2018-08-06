class RemoveImageFromVoteLogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :vote_logs, :image, :string
  end
end
