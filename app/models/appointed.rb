class Appointed < ActiveRecord::Base
  belongs_to :job_seeker
  belongs_to :recruiter
end
