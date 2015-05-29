require 'pry'
get '/stats/:id' do
 current_survey = Survey.find_by(id:params[:id])
 questions = current_survey.questions
 submits = (SurveyAnswer.all().count)/(questions.count)
  p stats = question_stats(questions)
  #numer of survey responders-answers/question= survey user resposes
 erb :'stats/stats', locals:{survey: current_survey,questions:questions,submits:submits, stats:questions_stats }
end

def find_count(id )
binding.pry
  ans = SurveyAnswer.find_by(answer_id:id)

end

def ans_stats (ques)
 answers = ques.answers
 a = find_count((answers[0].id))
 b = find_count((answers[1].id))
 c = find_count((answers[2].id))
 d = find_count((answers[3].id))
 ans_stats = [a,b,c,d]
end

def question_stats (questions)
 stats = []
 questions.each do |question|
   stats << [question.body,ans_stats(question)]
 end
 stats
end
