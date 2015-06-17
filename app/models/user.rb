class User < ActiveRecord::Base
  has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :images

  has_attached_file :user_picture,
  styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :user_picture,
    content_type: /\Aimage\/.*\z/
end
