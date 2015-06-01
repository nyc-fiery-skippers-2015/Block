get '/surveys/:id/questions/new' do
  cur_survey = {id: params[:id]}
  erb :'/questions/new', locals: {survey: cur_survey}, layout: false
end

# Dont nest your routes too deeply.  Only nest if necessary.
# Survey.id is not used in this method
get '/surveys/:id/questions/edit/:question_id' do
  cur_question = Question.find_by(id: params[:question_id])
  erb :"/questions/edit", locals: {survey: cur_question.survey, question: cur_question}, layout: false
end

# Survey.id is not used in this method
put '/surveys/:id/questions/:question_id' do
  cur_question = Question.find_by(id: params[:question_id])
  cur_question.update(params[:question])
  erb :'/questions/show', locals: {question: cur_question}, layout: false
end

post '/surveys/:id/questions' do
  new_question = Question.new(body: params[:question][:body], survey_id: params[:id])
  user_input = params[:answer]
  return [500, "Invalid Question"] unless new_question.save
  user_input.each {|k, v| Answer.create(answer: v, question_id: new_question.id)}
  erb :'/questions/show', locals: {question: new_question}, layout: false
end

# Survey.id is not used in this method
delete 'surveys/:id/questions/:question_id' do
  cur_question = Question.find_by(id: params[:question_id])
  if cur_question
    cur_question.destroy
  end
  redirect "/surveys/#{cur_question.survey_id}"
end
