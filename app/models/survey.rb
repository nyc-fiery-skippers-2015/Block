class Survey < ActiveRecord::Base

  belongs_to :creator, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :survey_answers
  has_many :answers, through: :questions

  def submissions_count
    survey_answers.count / questions.count
  end
end
