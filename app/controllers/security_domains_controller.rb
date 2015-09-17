class SecurityDomainsController < ApplicationController
    before_filter :authenticate_user
  before_filter :authorized_only
  
  before_action :set_security_domain, only: [:show, :edit, :update, :destroy]

  # GET /security_domains
  # GET /security_domains.json
  def index
    @security_domains = SecurityDomain.all
  end

  # GET /security_domains/1
  # GET /security_domains/1.json
  def show
  end

  # GET /security_domains/new
  def new
    @security_domain = SecurityDomain.new
  end

  # GET /security_domains/1/edit
  def edit
  end

  # POST /security_domains
  # POST /security_domains.json
  def create
    @security_domain = SecurityDomain.new(security_domain_params)

    respond_to do |format|
      if @security_domain.save
        format.html { redirect_to @security_domain, notice: 'Security domain was successfully created.' }
        format.json { render :show, status: :created, location: @security_domain }
      else
        format.html { render :new }
        format.json { render json: @security_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /security_domains/1
  # PATCH/PUT /security_domains/1.json
  def update
    respond_to do |format|
      if @security_domain.update(security_domain_params)
        format.html { redirect_to @security_domain, notice: 'Security domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @security_domain }
      else
        format.html { render :edit }
        format.json { render json: @security_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_domains/1
  # DELETE /security_domains/1.json
  def destroy
    @security_domain.destroy
    respond_to do |format|
      format.html { redirect_to security_domains_url, notice: 'Security domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_domain
      @security_domain = SecurityDomain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def security_domain_params
      params.require(:security_domain).permit(:name)
    end
end
