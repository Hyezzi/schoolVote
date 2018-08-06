class AddPasswordToVoteLog < ActiveRecord::Migration[5.0]
  def change
    add_column :vote_logs, :password, :string
  end
end
