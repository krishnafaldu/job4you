class ApplicationController < ActionController::Base
  before_action :set_peginate
  # protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :set_notifications, if: :recruiter_signed_in?

  def set_notifications
    @notifications = Notification.where(recipient: current_recruiter).recent
  end
  protected
    def after_sign_in_path_for(resource)
      if resource.class == JobSeeker
        job_seekers_job_ads_path 
      elsif resource.class == Recruiter
        recruiters_job_seekers_path 
      end
    end
    def set_peginate
      @per_page = params[:per_page].to_i <= 0 ? PER_PAGE : params[:per_page].to_i
      @page = params[:page].to_i <= 0 ? 1 : params[:page].to_i
    end
end
