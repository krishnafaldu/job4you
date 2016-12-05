class JobSeekers::JobSeekersController < JobSeekers::JobSeekersLoginController
  before_action :set_job_seeker, only: [:show, :edit, :update, :destroy]

  def index
    @job_seekers = JobSeeker.search_for(params[:search]).page(@page).per(@per_page)
  end

  def show
  end


  def new
    @job_seeker = JobSeeker.new
  end

  def edit
  end


  def create
    @job_seeker = JobSeeker.new(job_seeker_params)

    respond_to do |format|
      if @job_seeker.save
        JobSeekerSignupJob.perform_later(@job_seeker)
        format.html { redirect_to new_job_seeker_session_path, notice: 'Job seeker was successfully created.' }
        format.json { render :show, status: :created, location: @job_seeker }
      else
        format.html { render :new }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_seeker.update(job_seeker_params)
        format.html { redirect_to job_seekers_job_seeker_path, notice: 'Job seeker was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_seeker }
      else
        format.html { render :edit }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_seeker.destroy
    respond_to do |format|
      format.html { redirect_to job_seekers_url, notice: 'Job seeker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_seeker
      @job_seeker = JobSeeker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_seeker_params
      params.require(
        :job_seeker).permit(
        :first_name,
        :last_name,
        :contact,
        :email,
        :city,
        :image,
        :gender,
        :password,
        :experience,
        :industry,
        :function,
        :key_skills,
        :qualification,
        :password_confirmation,
        :resume
        )
    end
end

