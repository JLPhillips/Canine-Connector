class User < ActiveRecord::Base
  has_many :dogs, dependent: :destroy
  mount_uploader :user_image, UserImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
