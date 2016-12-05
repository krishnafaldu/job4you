class JobAd < ActiveRecord::Base
  belongs_to :recruiter
  has_many :job_applications
  has_many :job_seekers, through: :job_applications
  scoped_search on: [:title, :key_skills, :industry, :function, :city]
  validates :email, :city, :key_skills, :title, presence: true
end
