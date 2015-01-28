get '/' do
  erb :index
end

get '/user/:id' do
  @groups = User.find(current_user.id).groups
  erb :home
end

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

put '/group/:id' do |id|
  @group = Group.find(id)
  @group.games << Game.create(name: params[:game][:name])
  erb :group
end

post '/game/new' do
  group = Group.find(params[:group][:id])
  erb :_create_game_form, locals: {group: group}, layout: false
end




