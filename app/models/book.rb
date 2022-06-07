class Book < ApplicationRecord
    belongs_to :author , dependent: :destroy
    has_many_attached :cover_photos, dependent: :destroy
    has_rich_text :body
    validates :cover_photos, attached: true,
                content_type: ['image/png'],
                aspect_ratio: :square, size: { less_than_or_equal_to: 1.megabytes, message: "Must be less than or equal to 1MB"}


    def cover_photos_as_thumbnails
        cover_photos.map do |cover_photo|
            cover_photo.variant(resize_to_limit: [150, 150]).processed
        end
    end

end
