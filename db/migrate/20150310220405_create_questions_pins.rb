class CreateQuestionsPins < ActiveRecord::Migration
  def change
    create_table :questions_pins do |t|
      t.integer :question_id
      t.integer :submit_id
    end
  end
end
