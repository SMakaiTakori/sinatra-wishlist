class WishlistsController < ApplicationController

    get '/wishlists' do
        @wishlists = Wishlist.all
        erb :'wishlists/index'
    end

    get '/wishlist/new' do
        if logged_in?(session)
        erb :'wishlists/new'
        else
            redirect to '/'
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
            redirect to "/"
        end
        @wishlist = Wishlist.find_by(id: params[:id])      
        if !@wishlist                     
            redirect to "/"
        end
            erb :'/wishlists/show'           
    end

end