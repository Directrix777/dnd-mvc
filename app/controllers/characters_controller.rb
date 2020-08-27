class CharactersController < ApplicationController

    get '/characters' do
        @characters = Character.all
        erb :index
    end



end