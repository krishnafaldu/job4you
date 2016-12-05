class JobSeekers::JobApplicationsController < JobSeekers::JobSeekersLoginController
  before_action :authenticate_job_seeker!
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
    @job_application.job_seeker= current_job_seeker

    respond_to do |format|
      if @job_application.save
         @job_application.job_seeker = current_job_seeker

        Notification.create(recipient: job_ad.recruiter , actor: current_job_seeker, action: "posted", notifiable: @job_application)

        JobApplicationJob.perform_later(@job_application)
        format.html { redirect_to job_seekers_job_applications_path, notice: 'Job application was successfully created.' }
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
      format.html { redirect_to job_seekers_job_applications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

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
