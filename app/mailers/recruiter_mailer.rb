class RecruiterMailer < ApplicationMailer
  default from: 'info@job4you.com'
    def welcome_email(recruiter)
      @recruiter = recruiter
      mail(
        to: @recruiter.email,
        subject: 'Welcome to Job4You.com'
      )
    end
end
