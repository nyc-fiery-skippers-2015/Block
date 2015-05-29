get '/stats/:id' do
 current_survey = Survey.find_by(id:params[:id])
 questions = current_survey.questions
 survey_answers = current_survey.survey_answers
 choices = current_survey.answers
# Look in app/views/index.erb
 erb :'stats/stats', locals:{survey: current_survey,questions:questions,choices:choices,survey_answers:survey_answers }
end
