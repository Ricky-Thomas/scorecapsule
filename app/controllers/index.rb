get '/' do
  if current_user
    redirect "/user/#{current_user.id}"
  else
    erb :index
  end
end


