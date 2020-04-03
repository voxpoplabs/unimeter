class UsersController < ApplicationController
    load_and_authorize_resource
        
    def new
        # Initialized by CanCanCan
    end
    
    def create
        # @user = User.new(user_params)
        if @user.save
            #handle a successful save
            log_in @user
            redirect_to dashboard_path
        else
            render "new"
        end
    end
    
    def edit
        # Initialized by CanCanCan
    end
    
    def update
        # @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            #successful update
            flash[:success] = "Profile Updated"
            redirect_to dashboard_path
        else
            render "edit"
        end
    end

    
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :invite_code); 
    end
    
end
