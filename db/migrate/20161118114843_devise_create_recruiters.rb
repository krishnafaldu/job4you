class DeviseCreateRecruiters < ActiveRecord::Migration
  def change
    create_table :recruiters do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :first_name,                limit: 100
      t.string :last_name,                 limit: 100
      t.string :contact
      t.string :city
      t.string :image
      t.boolean :gender
      t.string :password
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :recruiters, :email,                unique: true
    add_index :recruiters, :reset_password_token, unique: true
    # add_index :recruiters, :confirmation_token,   unique: true
    # add_index :recruiters, :unlock_token,         unique: true
  end
end
