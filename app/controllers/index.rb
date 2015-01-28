get '/' do
  if current_user
    redirect "/user/#{current_user.id}"
  else
    erb :index
  end
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

post '/group/:id' do |id|
  if request.xhr?
    @group = Group.find(id)
    @group.games << Game.create(name: params[:game][:name])
    erb :group
  else
    redirect "/group/#{id}"
  end
end

post '/game/new' do
  group = Group.find(params[:group][:id])
  erb :_create_game_form, locals: {group: group}, layout: false
end

get '/clash/new' do
  game = Game.find(params[:game][:id])
  erb :_create_clash_form, locals: {game: game}, layout: false
end

post '/clash/new' do
  game = Game.find(params[:clash][:game_id])
  @group = Group.find(game.group_id)
  params[:clash][:winner] = User.find_by(name: params[:clash][:winner]).id
  params[:clash][:runner_up] = User.find_by(name: params[:clash][:runner_up]).id
  params[:clash][:fool] = User.find_by(name: params[:clash][:fool]).id
  Clash.create(params[:clash])
  erb :group
end

