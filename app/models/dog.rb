class Dog < ActiveRecord::Base
  belongs_to :user

  mount_uploader :picture, DogPictureUploader

  include PgSearch
  pg_search_scope :search, against:  [:name, :responds_to, :breed, :age, :features, :main_color,
    :secondary_colors, :unique_features, :location, :gender], using: {tsearch: {dictionary: "english"}}, associated_against: {user: :user_name}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
end
