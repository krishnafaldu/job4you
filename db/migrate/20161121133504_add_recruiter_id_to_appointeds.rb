class AddRecruiterIdToAppointeds < ActiveRecord::Migration
  def change
    add_column :appointeds, :recruiter_id, :integer
  end
end
