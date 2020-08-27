require './config/environment'

use Rack::MethodOverride
use CharactersController
use UsersController
run ApplicationController