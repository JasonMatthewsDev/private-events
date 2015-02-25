class SessionsController < ApplicationController
    
    def new

    end
    
    def create
        user = User.find_by(username: params[:session][:username].downcase)
        
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "Logged in as #{user.username}"
            log_in user
            redirect_to root_url
        else
            flash.now[:danger] = "Incorrect username / password combination"
            render 'new'
        end
    end
    
    def destroy
        log_out
        redirect_to root_url
    end
    
    private
    
        def log_in(user)
            session[:user_id] = user.id
        end
        
        def log_out
            session.delete(:user_id)
        end
end
