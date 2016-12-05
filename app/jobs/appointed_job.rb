class AppointedJob < ActiveJob::Base
  queue_as :default

  def perform(appointed)
    AppointedMailer.welcome_email(appointed).deliver_later
  end
end
