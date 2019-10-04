class TaskHasSecurityDomainsController < ApplicationController
    before_action :authenticate_user
  before_action :authorized_only
  
  before_action :set_task_has_security_domain, only: [:show, :edit, :update, :destroy]

  # GET /task_has_security_domains
  # GET /task_has_security_domains.json
  def index
    @task_has_security_domains = TaskHasSecurityDomain.all
  end

  # GET /task_has_security_domains/1
  # GET /task_has_security_domains/1.json
  def show
  end

  # GET /task_has_security_domains/new
  def new
    @task_has_security_domain = TaskHasSecurityDomain.new
  end

  # GET /task_has_security_domains/1/edit
  def edit
  end

  # POST /task_has_security_domains
  # POST /task_has_security_domains.json
  def create
    @task_has_security_domain = TaskHasSecurityDomain.new(task_has_security_domain_params)

    respond_to do |format|
      if @task_has_security_domain.save
        format.html { redirect_to @task_has_security_domain, notice: 'Task has security domain was successfully created.' }
        format.json { render :show, status: :created, location: @task_has_security_domain }
      else
        format.html { render :new }
        format.json { render json: @task_has_security_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_has_security_domains/1
  # PATCH/PUT /task_has_security_domains/1.json
  def update
    respond_to do |format|
      if @task_has_security_domain.update(task_has_security_domain_params)
        format.html { redirect_to @task_has_security_domain, notice: 'Task has security domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_has_security_domain }
      else
        format.html { render :edit }
        format.json { render json: @task_has_security_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_has_security_domains/1
  # DELETE /task_has_security_domains/1.json
  def destroy
    @task_has_security_domain.destroy
    respond_to do |format|
      format.html { redirect_to task_has_security_domains_url, notice: 'Task has security domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_has_security_domain
      @task_has_security_domain = TaskHasSecurityDomain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_has_security_domain_params
      params.require(:task_has_security_domain).permit(:task_id, :security_domain_id)
    end
end
