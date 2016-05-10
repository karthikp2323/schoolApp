class SchoolUser < ActiveRecord::Base
  require "paperclip"
  has_secure_password

  belongs_to :role
  belongs_to :school
  belongs_to :activity

  has_many :classroom, dependent: :destroy
  has_many :event, dependent: :destroy	

  has_attached_file :image, :styles => {:small => "250x250>"},
  					:url  => "/assets/products/profileimages/:id/:style/:basename.:extension",
                  	:path => ":rails_root/public/assets/products/profileimages/:id/:style/:basename.:extension"

  #validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/jpg']


  def image_url
        image.url(:small)
    end
  

end
