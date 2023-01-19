class User < ApplicationRecord
  
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    has_many :movies
    has_one_attached :avatar
    has_many :comments 

    validates :login, presence: true
    validates :avatar, file_size: { less_than_or_equal_to: 5.megabytes },
    file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

    enum status: { regular: 0, admin: 1 }

end
