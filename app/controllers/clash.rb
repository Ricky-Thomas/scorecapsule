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
  clash = Clash.create(params[:clash])
  game.set_leader
  erb :_clash_display, locals: {clash: clash, game: game}, layout: false
end
