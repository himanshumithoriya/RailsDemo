class UsersController < ApplicationController
  def index
    @users = User.all
    unless session[:username].nil?
      session.delete(:username)
      # redirect_to root_path
      # redirect_to login_path
    else
      # session.delete(:username)
      redirect_to login_path, notice: "You have succesfull logged out"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path 
    else
      render :new
    end
  end  


  def show
    @user = User.find(params[:id])
  end


  def login
  end
  
  def login1
    username = params[:username]
    password = params[:password]
    if User.find_by(username: username) && User.find_by(password: password)
        session[:username] = username
        flash[:notice] = "You have logged in succesfull!!!"
      redirect_to index_path
    else
      redirect_to controller: :users, action: :login   
    end
  end

  



  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
