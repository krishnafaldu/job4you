class AddUidAndProviderToJoobSeekers < ActiveRecord::Migration
  def change
    add_column :job_seekers, :uid, :string
    add_column :job_seekers, :provider, :string
  end
end
