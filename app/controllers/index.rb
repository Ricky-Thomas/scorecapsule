get '/' do
  erb :index
end

get '/user/:id' do
  @groups = User.find(current_user.id).groups
  erb :home
end

get '/group/new' do
end

post '/group/new' do
end

get '/group/:id' do |id|
end



