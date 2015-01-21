class UsersController < ApplicationController
  
  skip_before_action :require_login, :only => [:login, :create, :allow_login, :new]

  def index
  
  end

  def new
    @user=User.new
  end
  
  def create 
    params.permit!
    debugger
    @user=User.new(params[:user])
    if @user.save
      redirect_to action: "show"
      flash[:notice]= "User Successfully created."
    else
      render "new"
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    params.permit!
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to action: "index"
    else
      render "new"
    end
  end
  
  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to action: "show"
  end

  def show
    @user=User.all
  end

  def login
    @user = User.new
  end

  def allow_login
    # if params[:user][:email] && params[:user][:password]
      # if User.find_by_email_and_password(params[:user][:email], Digest::MD5.hexdigest(params[:user][:password]))
        #debugger
        user= User.authenticate(params[:user][:email],params[:user][:password])
        if user
        user = User.find_by_email_and_password(params[:user][:email], Digest::MD5.hexdigest(params[:user][:password])) 
        session[:user_id] = user.id
        redirect_to controller: "authors" , action: "index"
        flash[:notice] = "You have been successfully logged in"
      else
        render "login"
        flash[:notice] = "Invalid Email and password"
      end
    # end
  end

  def logout
    session[:user_id] = nil
    redirect_to action: "index"
    flash[:notice] = "You have been successfully logged out"
  end
 
  private
    def user_params
      params.request(:user).permit(:f_name, :l_name, :email, :phone, :address, :active,:password)
    end
end
