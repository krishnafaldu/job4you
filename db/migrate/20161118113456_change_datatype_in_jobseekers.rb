class ChangeDatatypeInJobseekers < ActiveRecord::Migration
  def change
    change_column :job_seekers , :gender, :string , limit: 1
  end
end
