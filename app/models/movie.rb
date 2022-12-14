class Movie < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments

    has_one_attached :image

    validates :title, :year, :description, :movie_length, :director, :language, :rating, :category_id, :user_id, presence: true
    validate :correct_image_file_type
    
    private

    def correct_image_file_type
        if image.attached? && ['image/png', 'image/jpg', 'image/jpeg'].exclude?(image.content_type)
            errors.add(:image, 'Must be jpg or png file')
        end
    end
end
