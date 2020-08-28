class UsersController < ApplicationController
    get '/signup' do
        if Helpers.is_logged_in?(session)
            redirect to '/characters'
        end
        erb :'users/new'
    end

    post '/signup' do
        if  params.include?("")
            session[:error] = "Please fill out all fields"
            redirect '/signup'
        end
        user = User.new(params)
        if user.invalid?
            session[:error] = "That username is already taken"
            redirect to '/signup'
        end
        session[:user_id] = user.id
        redirect to '/characters'
    end

    get '/logout' do
        if !Helpers.is_logged_in?(session)
            redirect to '/characters'
        end
        erb :'users/logout'
    end

    post '/logout' do
        session.clear
        redirect '/login'
    end

    get '/login' do
        if Helpers.is_logged_in?(session)
            redirect to '/characters'
        end
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/characters"
        else
            session[:error] = "Incorrect username or password"
			redirect "/login"
		end
    end

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end
end