require './config/environment'

use Rack::MethodOverride
use WishlistsController
use UsersController
run ApplicationController
