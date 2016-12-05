class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: "Recruiter"
  belongs_to :actor, class_name: "JobSeeker"
  belongs_to :notifiable, polymorphic: true

  scope :unread, ->{ where(read_at: nil) }
  scope :recent, ->{ order(created_at: :desc).limit(5) }
end
