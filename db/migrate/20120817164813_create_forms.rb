class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.integer :number_of_questions
      t.text :data

      t.timestamps
    end
  end
end