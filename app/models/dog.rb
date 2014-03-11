class Dog < ActiveRecord::Base
belongs_to :user

mount_uploader :picture, DogPictureUploader

end
