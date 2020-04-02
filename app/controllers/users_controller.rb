class UsersController < ApplicationController

    get '/users' do
        if logged_in?(session)
            @users = User.all
        else
            redirect to '/'
        end
            erb :'users/index'
    end
    
    get '/signup' do
        if logged_in?(session)  
            user = current_user(session)
            redirect to "/users/#{user.id}"
        end         
        erb :'users/signup'
    end

    post '/signup' do
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id        
            redirect to "/users/#{user.id}"
        else
            redirect to "/signup"
        end
    end

end