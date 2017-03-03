class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait



  def clickbait
    clickbait_titles= /Won't Believe|Secret|Top \d+|Guess/
    if !clickbait_titles.match(self.title)
      errors.add(:title, "Title is not clickbait-y")
    end
  end


end
