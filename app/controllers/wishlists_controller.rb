class WishlistsController < ApplicationController

    get '/wishlists' do
        @wishlists = Wishlist.all
        erb :'wishlists/index'
    end

    get '/wishlist/new' do
        if logged_in?(session)
        erb :'wishlists/new'
        else
            #flash message
            redirect to "/"
        end
    end

    post '/wishlists' do       
        wishlist = Wishlist.create(params["wishlist"])
        user = current_user(session)
        wishlist.user = user
        wishlist.save
        
        params["items"].each do |item|
           i = Item.create(item)
           i.wishlist = wishlist 
           i.save
        end
        redirect to "/users/#{user.id}"
    end

    get '/wishlists/:id' do      
        if !logged_in?(session)
            #flash message
            redirect to "/login"
        end
        @wishlist = Wishlist.find_by(id: params[:id])      
        if !@wishlist    
            #flash message                 
            redirect to "/"
        end
            erb :'/wishlists/show'           
    end

    get '/wishlists/:id/edit' do
        @wishlist = Wishlist.find_by(id: params[:id])  

        if !logged_in?(session) || !@wishlist || @wishlist.user != current_user(session)
            redirect to "/"
        end
        erb :'/wishlists/edit'
    end

end