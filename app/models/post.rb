class Post < ActiveRecord::Base
    belongs_to :author

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbaity_title

    def clickbaity_title
        clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
        if self.title && !clickbait.any? {|str| self.title.include?(str)}
            errors.add(:title, "title is not clickbait-y enough")
        end
    end

end
