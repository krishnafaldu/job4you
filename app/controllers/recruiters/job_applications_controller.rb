class Recruiters::JobApplicationsController < Recruiters::RecruitersLoginController
  before_action :authenticate_recruiter!
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]

  def index
    @job_applications = JobApplication.all
  end


  def show
  end


  def new
    @job_application = JobApplication.new(job_ad_id: params[:j_id])
  end

  def edit
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    job_ad = JobAd.find_by_id(params[:job_application][:job_ad_id])
    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job_application, notice: 'Job application was successfully created.' }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to @job_application, notice: 'Job application was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_application_params
      params.require(
        :job_application
        ).permit(
          :resume,
          :job_ad_id,
          :job_seeker_id,
          :recruiter_id
          )
    end
end
