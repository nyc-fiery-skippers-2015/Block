# I dont think I would have my root route point to the login ERB... kinda weird
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
  if new_user.save
    session[:user_id] = new_user.id
    redirect "/user/#{new_user.id}"
  else
    redirect "/?error=internalerror"
  end
end
