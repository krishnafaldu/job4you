class JobApplicationJob < ActiveJob::Base
  queue_as :default

  def perform(job_application)
    JobApplicationMailer.welcome_email(job_application).deliver_later
  end
end
