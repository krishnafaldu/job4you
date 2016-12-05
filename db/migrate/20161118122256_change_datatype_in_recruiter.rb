class ChangeDatatypeInRecruiter < ActiveRecord::Migration
  def change
    change_column :recruiters , :gender, :string , limit: 1
  end
end
