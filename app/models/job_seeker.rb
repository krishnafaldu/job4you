class JobSeeker < ActiveRecord::Base
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :omniauthable
  

  validates :first_name ,presence: true
  # \validates :contact  numericality: { message: "please enter valid number" }
  # validates_length_of :contact, minimum: 10, maximum: 10

  mount_uploader :resume, ResumeUploader
  mount_uploader :image, ImageUploader

  has_many :appointeds
  has_many :notifications
  has_many :job_applications

  scoped_search on: [:city, :function, :industry, :qualification, :key_skills]

  def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |job_seeker|
      job_seeker.provider = auth.provider
      job_seeker.password = Devise.friendly_token[0,20]
      job_seeker.uid = auth.uid
      job_seeker.image = auth.info.image
      job_seeker.first_name = auth.info.name
      # job_seeker.last_name = auth.info.last_name
      job_seeker.contact = auth.info.contact
      job_seeker.email = auth.info.email
    end
  end
end