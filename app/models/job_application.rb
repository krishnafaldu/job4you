class JobApplication < ActiveRecord::Base
  belongs_to :job_seeker
  belongs_to :recruiter
  belongs_to :job_ad
  mount_uploader :resume, ResumeUploader
  validates(:resume, presence: true)
end
