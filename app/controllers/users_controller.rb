class UsersController < ApplicationController
	skip_before_filter :authenticate_user!
  before_action :authenticate_admin! 
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to users_path , notice:"New User Created"
  	else
  		render 'new'
  	end
  end

  def delete
    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path , notice: "User Removed Successfully"
  end

  private

  def user_params
      params.require(:user).permit(:username , :password , :registry_officer, :office_id)
    end
end
