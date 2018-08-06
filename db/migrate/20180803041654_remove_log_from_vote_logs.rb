class RemoveLogFromVoteLogs < ActiveRecord::Migration[5.0]
  def change
    remove_reference :vote_logs, :log, foreign_key: true
  end
end
