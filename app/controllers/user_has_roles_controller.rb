class UserHasRolesController < ApplicationController
    before_action :authenticate_user
  before_action :authorized_only
  
  before_action :set_user_has_role, only: [:show, :edit, :update, :destroy]

  # GET /user_has_roles
  # GET /user_has_roles.json
  def index
    @user_has_roles = UserHasRole.all
  end

  # GET /user_has_roles/1
  # GET /user_has_roles/1.json
  def show
  end

  # GET /user_has_roles/new
  def new
    @user_has_role = UserHasRole.new
  end

  # GET /user_has_roles/1/edit
  def edit
  end

  # POST /user_has_roles
  # POST /user_has_roles.json
  def create
    @user_has_role = UserHasRole.new(user_has_role_params)

    respond_to do |format|
      if @user_has_role.save
        format.html { redirect_to @user_has_role, notice: 'User has role was successfully created.' }
        format.json { render :show, status: :created, location: @user_has_role }
      else
        format.html { render :new }
        format.json { render json: @user_has_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_has_roles/1
  # PATCH/PUT /user_has_roles/1.json
  def update
    respond_to do |format|
      if @user_has_role.update(user_has_role_params)
        format.html { redirect_to @user_has_role, notice: 'User has role was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_has_role }
      else
        format.html { render :edit }
        format.json { render json: @user_has_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_has_roles/1
  # DELETE /user_has_roles/1.json
  def destroy
    @user_has_role.destroy
    respond_to do |format|
      format.html { redirect_to user_has_roles_url, notice: 'User has role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_has_role
      @user_has_role = UserHasRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_has_role_params
      params.require(:user_has_role).permit(:user_id, :role_id)
    end
end
