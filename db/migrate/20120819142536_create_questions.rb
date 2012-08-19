class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :value
      t.string :format
      t.belongs_to :form
      t.integer :arrangement

      t.timestamps
    end
    add_index :questions, :form_id
  end
end
