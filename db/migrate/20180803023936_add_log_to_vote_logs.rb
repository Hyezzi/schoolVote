class AddLogToVoteLogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :vote_logs, :log, foreign_key: true
  end
end
