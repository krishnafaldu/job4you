class AddLatAndLongToJobAds < ActiveRecord::Migration
  def change
    add_column :job_ads, :lat, :float
    add_column :job_ads, :long, :float
  end
end
