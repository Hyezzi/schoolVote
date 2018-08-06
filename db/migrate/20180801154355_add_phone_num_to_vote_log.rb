class AddPhoneNumToVoteLog < ActiveRecord::Migration[5.0]
  def change
    add_column :vote_logs, :phoneNum, :string
  end
end
