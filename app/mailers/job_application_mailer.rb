class JobApplicationMailer < ApplicationMailer
  default from: 'kjfaldu94@ymail.com'
   
    def welcome_email(job_application)
      @job_application = job_application
      mail(to: @job_application.job_ad.email, subject: 'New Job Apllication')
    end
end
