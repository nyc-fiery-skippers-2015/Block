get '/surveys/:id/questions/new' do
  cur_survey = {id: params[:id]}
  erb :'/questions/new', locals: {survey: cur_survey}
end

post '/surveys/:id/questions' do
  new_question = Question.new(body: params[:question][:body], survey_id: params[:id])
  return [500, "Invalid Question"] unless new_question.save
  redirect "/surveys/#{new_question.survey_id}"
end

delete 'surveys/:id/questions/:question_id' do
  cur_question = Question.find_by(id: params[:question_id])
  if cur_question
    cur_question.destroy
  end
  redirect "/surveys/#{cur_question.survey_id}"
end