get '/' do
  erb :index
end

get '/user/:id' do
  @groups = User.find(current_user.id).groups
  erb :home
end
