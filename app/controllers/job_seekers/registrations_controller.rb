class JobSeekers::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end
 
  def create
    @job_seeker = JobSeeker.new(job_seeker_params)
    respond_to do |format|
      if @job_seeker.save
        JobSeekerMailer.welcome_email(@job_seeker).deliver_later
        format.html { redirect_to new_job_seeker_session_path, notice: 'Job seeker was successfully created.'}
        # format.html { redirect_to @job_seeker, notice: 'Job seeker was successfully created.' }
        format.json { render :show, status: :created, location: @job_seeker }
      else
        format.html { render :new }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    super
  end

  def update
    respond_to do |format|
      if @job_seeker.update(job_seeker_params)

      else
        format.html { render :edit }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  def job_seeker_params
    params.require(
      :job_seeker
    ).permit(
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
      :resume,
      :password_confirmation,
      :encrypted_password
    )
  end
end