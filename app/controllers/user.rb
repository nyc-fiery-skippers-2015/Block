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


get '/user/:id/edit' do
  require_logged_in
  erb :'user/edit'
end


put '/user/edit' do
  cur_user = User.find_by(id: session[:user_id])
  cur_user.update(params[:user])
  return [500, "Invalid Entry"] unless cur_user.save
  redirect "/user/#{current_user.id}"
end

delete '/user/delete' do
  current_user = User.find_by(id: session[:user_id])
  current_user.destroy
  redirect '/'
end
