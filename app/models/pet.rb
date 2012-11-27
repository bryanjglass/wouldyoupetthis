class Pet < ActiveRecord::Base
  acts_as_voteable
  has_attached_file :photo,
    :styles => {
      :thumb => "160x120>",
      :medium => "640x480>",
      :large => "960x720>"
    }

  def photo_thumb_url
    photo.url(:thumb)
  end

  def photo_medium_url
    photo.url(:medium)
  end

  def photo_large_url
    photo.url(:large)
  end
end
