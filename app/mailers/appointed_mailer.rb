class AppointedMailer < ApplicationMailer
  default from: 'kjfaldu94@ymail.com'
    def welcome_email(appointed)
      @appointed = appointed
      mail(to: @appointed.job_seeker.email, subject: 'New Job Apllication')
    end
end
