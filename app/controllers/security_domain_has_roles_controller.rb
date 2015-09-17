class SecurityDomainHasRolesController < ApplicationController
  before_action :set_security_domain_has_role, only: [:show, :edit, :update, :destroy]
  
  before_filter :authenticate_user
  before_filter :authorized_only

  # GET /security_domain_has_roles
  # GET /security_domain_has_roles.json
  def index
    @security_domain_has_roles = SecurityDomainHasRole.all
  end

  # GET /security_domain_has_roles/1
  # GET /security_domain_has_roles/1.json
  def show
  end

  # GET /security_domain_has_roles/new
  def new
    @security_domain_has_role = SecurityDomainHasRole.new
  end

  # GET /security_domain_has_roles/1/edit
  def edit
  end

  # POST /security_domain_has_roles
  # POST /security_domain_has_roles.json
  def create
    @security_domain_has_role = SecurityDomainHasRole.new(security_domain_has_role_params)

    respond_to do |format|
      if @security_domain_has_role.save
        format.html { redirect_to @security_domain_has_role, notice: 'Security domain has role was successfully created.' }
        format.json { render :show, status: :created, location: @security_domain_has_role }
      else
        format.html { render :new }
        format.json { render json: @security_domain_has_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /security_domain_has_roles/1
  # PATCH/PUT /security_domain_has_roles/1.json
  def update
    respond_to do |format|
      if @security_domain_has_role.update(security_domain_has_role_params)
        format.html { redirect_to @security_domain_has_role, notice: 'Security domain has role was successfully updated.' }
        format.json { render :show, status: :ok, location: @security_domain_has_role }
      else
        format.html { render :edit }
        format.json { render json: @security_domain_has_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_domain_has_roles/1
  # DELETE /security_domain_has_roles/1.json
  def destroy
    @security_domain_has_role.destroy
    respond_to do |format|
      format.html { redirect_to security_domain_has_roles_url, notice: 'Security domain has role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_domain_has_role
      @security_domain_has_role = SecurityDomainHasRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def security_domain_has_role_params
      params.require(:security_domain_has_role).permit(:domain_id, :role_id)
    end
end
