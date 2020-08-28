class CharactersController < ApplicationController

    get '/characters' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        @characters = Character.all
        erb :'characters/index'
    end

    post '/characters/dev' do
        binding.pry
    end

    get '/characters/new' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        erb :'characters/new'
    end

    post '/characters' do
        if params.values.include?("")
            session[:error] = "Please fill in all fields"
            redirect '/characters/new'
        end
        character = Character.create(params)
        character.user_id = session[:user_id]
        character.save

        redirect "/characters/#{character.id}"
    end

    get '/characters/:id' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        @character = Character.find(params[:id])
        erb :'characters/show'
    end

    get '/characters/:id/edit' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        @user = User.find(session[:user_id])
        @character = Character.find(params[:id])
        if @user != @character.user
            session[:error] = "That's not yours to edit!"
            redirect "/characters/#{@character.id}"
        end
        erb :'characters/edit'
    end

    patch '/characters/:id' do
        character = Character.find(params[:id])
        if params[:character][:content] == ""
            session[:error] = "Character cannot be blank"
            redirect "/characters/#{character.id}/edit"
        end
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        user = User.find(session[:user_id])
        if user == character.user
            character.update(params[:character])

        end
    end

    delete '/characters/:id' do
        if !Helpers.is_logged_in?(session)
            redirect to '/login'
        end
        user = User.find(session[:user_id])
        character = Character.find(params[:id])
        if user != character.user
            session[:error] = "That's not yours to delete!"
            redirect "/characters/#{character.id}"
        end
        Character.destroy(params[:id])
        redirect '/characters'
        
    end



end