class CreateQuestionsSubmits < ActiveRecord::Migration
  def change
    create_table :questions_submits do |t|
      t.integer :question_id
      t.integer :submit_id
    end
  end
end
