class JobSeekerSignupJob < ActiveJob::Base
  queue_as :default

  def perform(job_seeker)
    JobSeekerMailer.welcome_email(job_seeker).deliver_later
  end
end
