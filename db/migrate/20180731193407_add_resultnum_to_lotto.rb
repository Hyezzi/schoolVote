class AddResultnumToLotto < ActiveRecord::Migration[5.0]
  def change
    add_column :lottos, :resultnum, :text, default: [].to_yaml
  end
end
