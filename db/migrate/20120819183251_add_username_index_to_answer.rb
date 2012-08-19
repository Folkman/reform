class AddUsernameIndexToAnswer < ActiveRecord::Migration
  def change
    add_index :answers, :username
  end
end
