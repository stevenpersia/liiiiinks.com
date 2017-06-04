class Link < ApplicationRecord
  belongs_to :category

  has_attached_file :logo, styles: { medium: "96x96>", thumb: "96x96>" }, default_url: "/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

end
