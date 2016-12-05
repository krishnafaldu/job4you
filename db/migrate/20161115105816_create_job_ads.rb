class CreateJobAds < ActiveRecord::Migration
  def change
    create_table :job_ads do |t|
      t.string :title
      t.string :key_skills
      t.string :req_experience
      t.string :industry
      t.string :function
      t.string :job_details
      t.timestamps null: false
    end
  end
end
