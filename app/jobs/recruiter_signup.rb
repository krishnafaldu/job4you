class RecruiterSignup < ActiveJob::Base
  queue_as :default

  def perform(recruiter)
    RecruiterMailer.welcome_email(recruiter).deliver_later
  end
end