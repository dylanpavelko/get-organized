class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, :only => [:show, :edit, :index]
  before_action :authorized_only, only: [:index, :show, :update, :destroy]


  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @users = User.all
      if (@users.count == 1)
      	@user.update_attribute(:power_admin, true)
      else
        @public_user = Role.where(:name => "Public User").first
        @user_role = UserHasRole.new(:user_id => @user.id, :role_id => @public_user.id)
        @user_role.save
      end
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    authorized_user = @user
    session[:user_id] = authorized_user.id
    redirect_to sessions_home_path
  end

  def user_params
    params.require(:user).permit(:username, :email, :firstName, :lastName, :password, :role_id, :password_confirmation)
  end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
