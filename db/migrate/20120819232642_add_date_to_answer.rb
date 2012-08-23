class AddDateToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :date_time, :datetime
  end
end
