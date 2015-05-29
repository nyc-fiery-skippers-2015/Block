get '/' do
  erb :'auth/login'
end

post '/login' do
  current_user = User.find_by(name: params[:username])
  if current_user && current_user.authenticate(params[:password])
    session[:user_id] = current_user.id
    redirect "/user/#{current_user.id}"
  else
    redirect '/?error=ua'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/create/profile' do
  new_user = User.new(params[:user])
  new_user.id = session[:user_id]
  if new_user.save
    redirect "/user/#{new_user.id}"
  else
    redirect "/?error=internalerror"
  end
end
