class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end


  helpers do
    def current_user(session)
      User.find_by(id: session[:user_id])
    end 

    def logged_in?(session)
      !!session[:user_id]  
    end
  end
end