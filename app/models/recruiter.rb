class Recruiter < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  validates :contact, uniqueness: true, numericality: { message: "please enter valid number" }
  validates_length_of :contact, minimum: 10, maximum: 10
  has_many :job_ads
  has_many :appointeds
  has_many :notifications, foreign_key: :recipient_id
  has_many :job_applications
end
