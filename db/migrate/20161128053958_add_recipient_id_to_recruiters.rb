class AddRecipientIdToRecruiters < ActiveRecord::Migration
  def change
    add_column :recruiters, :recipient_id, :integer
  end
end
