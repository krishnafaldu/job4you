class Recruiters::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end
  def show
    @recruiter = Recruiter.find(params[:id])
  end
  def edit
    super
  end

  def create
    # add custom create logic here
    @recruiter = Recruiter.new(recruiter_params)

    respond_to do |format|
      if @recruiter.save
        format.html { redirect_to new_recruiter_session_path, notice: 'Recruiter was successfully created.' }
        format.json { render :show, status: :created, location: @recruiter }
      else
        format.html { render :new }
        format.json { render json: @recruiter.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @recruiter.update(recruiter_params)
        format.html { redirect_to recruiters_recruiter_path , notice: 'Recruiter was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @recruiter.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def recruiter_params
    params.require(
        :recruiter
      ).permit(
        :first_name,
        :last_name,
        :contact,
        :email,
        :city,
        :image,
        :gender,
        :password,
        :password_confirmation,
        :encrypted_password
        )
  end
end