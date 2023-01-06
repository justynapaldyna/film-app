class Comment < ApplicationRecord

    belongs_to :movie
    belongs_to :user

    validates :body, presence: true

    def self.scheduled_comment 
        Comment.create(body: "Comment from #{Time.now}", user_id: 1, movie_id: 3)
    end
    
end
