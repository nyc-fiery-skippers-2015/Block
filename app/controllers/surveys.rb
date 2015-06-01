require 'pry'

get '/surveys/:id/stats' do
  current_survey = Survey.find_by(id:params[:id])
  erb :'stats/stats', locals:{survey: current_survey,questions:questions,submits:submits, stats:stats }
end

get '/surveys' do
  require_logged_in
  all_surveys = Survey.all
  erb :'surveys/index', locals: {surveys: all_surveys}
end

get '/surveys/new' do
  require_logged_in
  erb :'/surveys/new'
end

# Might want to change :id -> :token to more properly represent what it represents!
get '/surveys/:id' do
  require_logged_in
  cur_survey = Survey.find_by(id: params[:id]) || Survey.find_by(url: params[:id])
  return [500, "Unauthorized Access"] unless cur_survey.creator_id == session[:user_id]
  return [500, "No Survey Found"] unless cur_survey
  erb :'surveys/show', locals: {survey: cur_survey}
end

post '/surveys' do
  user_input = params[:survey]
  rand_url = SecureRandom.hex(4)
  new_survey = Survey.new(name: user_input[:name], creator_id: session[:user_id], url: rand_url)
  return [500, "Survey Must Have a Name"] unless new_survey.save
  redirect "/surveys/#{new_survey.id}"
end

# this route would probably be more RESTful and have cleaner logic if you pass the
# survey id in the url?
post '/surveys/:id' do
  cur_survey = Answer.find_by(id: params.first[1]).question.survey.id
  params.each {|k,v| SurveyAnswer.create(answer_id: v, user_id: session[:user_id], survey_id: cur_survey)}
  redirect "/stats/#{cur_survey}"
end

