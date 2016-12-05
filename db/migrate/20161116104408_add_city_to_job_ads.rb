class AddCityToJobAds < ActiveRecord::Migration
  def change
    add_column :job_ads, :city, :string
    add_column :job_ads, :owner_name, :string
    add_column :job_ads, :email, :string
  end
end
