class JobSeekers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @job_seeker = JobSeeker.from_omniauth(request.env['omniauth.auth'])

    if @job_seeker.persisted?
      puts @job_seeker.errors.full_messages
      sign_in_and_redirect @job_seeker, event: :authentication
    else
      puts @job_seeker.errors.full_messages
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to root_path, flash: { error: 'Authentication failed!' }
    end
  end
  def facebook
    @job_seeker = JobSeeker.from_omniauth(request.env["omniauth.auth"])
    if @job_seeker.persisted?
      sign_in_and_redirect @job_seeker, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_job_seeker_registration_path
    end
  end
end