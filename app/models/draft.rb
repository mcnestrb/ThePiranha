class Draft < ActiveRecord::Base
	validate :title_or_photo
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

	private
		def title_or_photo
		  if title.blank? && photo.blank?
		    errors[:base] << "An article must have at least a photo or a title"
		  end
		end
end
