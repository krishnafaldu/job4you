class JobSeekers::JobAdsController < JobSeekers::JobSeekersLoginController
  before_action :authenticate_job_seeker!
  before_action :set_job_ad, only: [:show, :edit, :update, :destroy]
  def index
    @job_ads = JobAd.search_for(params[:search]).page(@page).per(@per_page)
  end

  def show
    @job_ad = JobAd.find(params[:id])
  end

  private

    def set_job_ad
      @job_ad = JobAd.find(params[:id])
    end

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
