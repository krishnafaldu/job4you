class Recruiters::AppointedsController < Recruiters::RecruitersLoginController
  before_action :authenticate_recruiter!
  before_action :set_appointed, only: [:show, :edit, :update, :destroy]

  def index
    @appointeds = Appointed.all
  end

  def show
  end

  def new
    @appointed = Appointed.new(job_seeker_id: params[:js_id])
    @job_seeker = JobSeeker.find_by_id(params[:js_id])
  end

  def edit
  end

  def create
    @appointed = Appointed.new(appointed_params)
    respond_to do |format|
      if @appointed.save
        AppointedJob.perform_later(@appointed)
        format.html { redirect_to recruiters_appointeds_path, notice: 'Appointed was successfully created.' }
        format.json { render :show, status: :created, location: @appointed }
      else
        format.html { render :new }
        format.json { render json: @appointed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointed.update(appointed_params)
        format.html { redirect_to @appointed, notice: 'Appointed was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointed }
      else
        format.html { render :edit }
        format.json { render json: @appointed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointed.destroy
    respond_to do |format|
      format.html { redirect_to recruiters_appointeds_url, notice: 'Appointed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointed
      @appointed = Appointed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointed_params
      params.require(
        :appointed
        ).permit(
          :job_seeker_id,
          :recruiter_id
          )
    end
end
