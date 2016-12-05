class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.integer :job_seeker_id
      t.integer :recruiter_id
      t.integer :job_ad_id
      t.string :resume
      t.timestamps null: false
    end
  end
end
