class WishlistsController < ApplicationController

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
            redirect to "/wishlists"
        end
        @wishlist = Wishlist.find_by(id: params[:id])      
        if !@wishlist                      
            redirect to "/wishlists"
        end
            erb :'/wishlists/show'           
    end

end