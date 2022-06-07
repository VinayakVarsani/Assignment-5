class Author < ApplicationRecord
    has_one_attached :profile_picture
    has_rich_text :body
    has_many :books ,dependent: :destroy
    validates :profile_picture,
                content_type: ['image/png'],
                aspect_ratio: :square, size: { less_than_or_equal_to: 1.megabytes, message: "Must be less than or equal to 1MB"}

    def profile_picture_as_thumbnail
        return unless profile_picture.content_type.in?(%w[image/png])
        profile_picture.variant(resize_to_limit: [70, 70]).processed
    end
end
