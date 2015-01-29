post '/game/new' do
  group = Group.find(params[:group][:id])
  erb :_create_game_form, locals: {group: group}, layout: false
end
