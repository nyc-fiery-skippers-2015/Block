get '/surveys' do
  all_surveys = Survey.all
  erb :'surveys/index', locals: {surveys: all_surveys}
end

get '/surveys/new' do
  erb :'/surveys/new'
end

get '/surveys/:id' do
  cur_survey = Survey.find_by(id: params[:id])
  if !cur_survey
    cur_survey = Survey.find_by(url: params[:id])
  end
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

