require 'pry'
get '/stats/:id' do
 current_survey = Survey.find_by(id:params[:id])
 questions = current_survey.questions
 submits = (current_survey.survey_answers.count)/(3 )
  stats = question_stats(questions)
  #numer of survey responders-answers/question= survey user resposes
 erb :'stats/stats', locals:{survey: current_survey,questions:questions,submits:submits, stats:stats }
end

def find_count(id )

  ans = SurveyAnswer.count(answer_id:id)

end

def ans_stats (question)

 answers = question.answers
 a = (answers[0].answer) + ((find_count((answers[0].id))).to_s )
 b = (answers[1].answer) + ((find_count((answers[1].id))).to_s )
 c = (answers[2].answer) +((find_count((answers[2].id))).to_s )
  d = (answers[3].answer) +((find_count((answers[3].id))).to_s )

 ans_stats = [a,b,c,d]
end

def question_stats (questions)
 stats = []
 questions.each do |question|
   stats << [question.body,ans_stats(question)]
 end
 stats
end
