class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.integer :user_id, null: false
      t.integer :survey_id, null: false
      t.integer :answer_id, null: false
      t.timestamps null: false
    end
  end
end
