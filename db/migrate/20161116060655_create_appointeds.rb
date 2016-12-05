class CreateAppointeds < ActiveRecord::Migration
  def change
    create_table :appointeds do |t|
      t.string :job_seeker_id
      t.string :resume
      t.timestamps null: false
    end
  end
end
