get '/group/new' do
  @current_user = User.find(current_user.id)
  erb :create_group_form
end

post '/group/new' do
  @current_user = User.find(current_user.id)
  new_group = Group.create(name: params[:group][:name])
  @current_user.groups << new_group
  friend = User.find_by(email: params[:user_group][:email])
  friend.groups << new_group
  redirect "user/#{current_user.id}"
end

get '/group/:id' do |id|
  @group = Group.find(id)
  erb :group
end

post '/group/:id' do |id|
  if request.xhr?
    @group = Group.find(id)
    @group.games << Game.create(name: params[:game][:name])
    erb :group
  else
    redirect "/group/#{id}"
  end
end
