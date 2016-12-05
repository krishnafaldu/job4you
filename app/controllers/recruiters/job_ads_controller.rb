class Recruiters::JobAdsController < Recruiters::RecruitersLoginController
  before_action :authenticate_recruiter!
  before_action :set_job_ad, only: [:show, :edit, :update, :destroy]

  def index
    @job_ads = JobAd.search_for(params[:search]).page(@page).per(@per_page)
  end


  def show
    @job_ad = JobAd.find(params[:id])
  end
  def new
    @job_ad = JobAd.new
  end

  def edit
  end

  def create
    @job_ad = JobAd.new(job_ad_params)

    respond_to do |format|
      if @job_ad.save
        format.html { redirect_to recruiters_job_ads_path, notice: 'Job ad was successfully created.' }
        format.json { render :show, status: :created, location: @job_ad }
      else
        format.html { render :new }
        format.js
        # format.json { render :json => { :error => @job_ad.errors.errors.full_messages }, :status => 422 }
        format.json { render json: @job_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_ads/1
  # PATCH/PUT /job_ads/1.json
  def update
    respond_to do |format|
      if @job_ad.update(job_ad_params)
        format.html { redirect_to [:recruiters, @job_ad], notice: 'Job ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_ad }
      else
        format.html { render :edit }
        format.json { render json: @job_ad.errors, status: :unprocessable_entity }
        format.js { render action: "update" }
      end
    end
  end

  def destroy
    @job_ad.destroy
    respond_to do |format|
      format.html { redirect_to recruiters_job_ads_url, notice: 'Job ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_ad
      @job_ad = JobAd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_ad_params
      params.require(
        :job_ad
      ).permit(
        :title,
        :key_skills,
        :req_experience,
        :recruiter_id,
        :industry,
        :function,
        :job_details,
        :city,
        :owner_name,
        :email
        )
    end
end
