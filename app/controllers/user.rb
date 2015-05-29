#profile page
get '/user/:id' do
  current_user = User.find_by(id: params[:id])
  erb :'index'
end

get '/users' do
  all_user = User.all
  erb :'user/show_all'
end

get '/user/:id/edit' do
  erb :'user/edit'
end

put '/user/edit' do
  redirect "/user/#{current_user.id}"
end

delete '/user/:id' do
  redirect '/'
end
