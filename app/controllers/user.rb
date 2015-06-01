require 'pry'

get '/users' do
  require_logged_in
  all_users = User.all
  erb :'user/show_all', locals: { users: all_users}
end

get '/user/areyousure' do
  erb :'user/areyousure'
end

get '/user/:id' do
  current_user = User.find_by(id: params[:id])
  erb :'user/index', locals: { user: current_user }
end

get '/user/:id/surveys/:url' do
  cur_survey = Survey.find_by(url: params[:url])
  erb :'/surveys/take_show', locals: {survey: cur_survey}
end

get '/user/:id/edit' do
  require_logged_in
  erb :'user/edit', layout: !request.xhr? #Leaner and Cleaner!
end

put '/user/edit' do
  cur_user = User.find_by(id: session[:user_id])
  cur_user.update(params[:user])
  return [500, "Invalid Entry"] unless cur_user.save
  if request.xhr?
    return cur_user.to_json
  end
  redirect "/user/#{cur_user.id}"
end

delete '/user/delete' do
  current_user = User.find_by(id: session[:user_id])
  current_user.destroy
  redirect '/'
end
