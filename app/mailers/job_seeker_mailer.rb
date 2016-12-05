class JobSeekerMailer < ApplicationMailer
  default from: 'info@job4you.com'
    def welcome_email(job_seeker)
      @job_seeker = job_seeker
      mail(to: @job_seeker.email, subject: 'Welcome to Job4You.com')
    end
end
