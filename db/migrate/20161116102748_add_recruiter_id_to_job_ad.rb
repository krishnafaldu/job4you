class AddRecruiterIdToJobAd < ActiveRecord::Migration
  def change
    add_column :job_ads, :recruiter_id, :integer
  end
end
