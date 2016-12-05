class NotificationsController < ApplicationController
  before_action :authenticate_recruiter!
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  def index
    @notifications = Notification.where(recipient: current_recruiter).recent
  end
  def mark_as_read
    @notifications = Notification.where(recipient: current_recruiter).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end


  def show
  end

  def new
    @notification = Notification.new
  end

  def edit
  end
end
