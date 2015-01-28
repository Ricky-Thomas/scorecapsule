post '/login' do
  @user = User.find_by(email: params[:user][:email])

  if @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  end
  set_error('Login Failed, Please Try Again')
  redirect "/"
end

post '/signup' do
  user = User.create(params[:user])
  if user.valid?
    session[:user_id] = user.id
    redirect "/user/#{current_user.id}"
  else
    set_error('Signup failed, Please Try Again')
    redirect "/"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
