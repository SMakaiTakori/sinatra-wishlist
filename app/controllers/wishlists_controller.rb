class WishlistsController < ApplicationController

    get '/wishlists/new' do
        if logged_in?(session)
        erb :'wishlists/new'
        end
    end


end