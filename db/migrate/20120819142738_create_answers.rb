class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :value
      t.belongs_to :question
      t.string :username

      t.timestamps
    end
    add_index :answers, :question_id
  end
end
