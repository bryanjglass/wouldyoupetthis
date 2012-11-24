class Pet < ActiveRecord::Base
  acts_as_voteable
  has_attached_file :photo,
    :styles => {
      :thumb => "160x120>",
      :medium => "640x480>",
      :large => "960x720>"
    }
end
