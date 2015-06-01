get '/stats/:id' do
  current_survey = Survey.find_by(id:params[:id])
  questions = current_survey.questions

  # These methods should be refactored to the Survey model
  # This route may be more appropriate on the Survey controller
  submits = (current_survey.survey_answers.count)/(questions.count)
  stats = question_stats(questions,submits)
 #numer of survey responders-answers/question= survey user resposes
  erb :'stats/stats', locals:{survey: current_survey,questions:questions,submits:submits, stats:stats }
end

def find_count(id )
  ans = SurveyAnswer.where(answer_id: id).count
end

def ans_stats (question,submits)
  answers = question.answers
  submits = submits.to_f
   a = ["#{answers[0].answer}", ((find_count((answers[0].id)))/submits)*100]
   b = ["#{answers[1].answer}", ((find_count((answers[1].id)))/submits)*100]
   c = ["#{answers[2].answer}", ((find_count((answers[2].id)))/submits)*100]
   d = ["#{answers[3].answer}", ((find_count((answers[3].id)))/submits)*100]
  ans_stats = [a, b, c, d]
end


def question_stats (questions,submits)
  questions.map do |question|
    [ question.body, ans_stats(question, submits) ].flatten
  end
end
