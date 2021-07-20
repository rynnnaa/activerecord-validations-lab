class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
  message: "pick one" }
  validate :title_sufficiently_clickbait_y
  
  def title_sufficiently_clickbait_y
    @titles = ["Won't Believe", "Secret", "Top [number]","Guess"]
    @titles.each do |t|
      unless t.present?
        errors.add(:title, "Has to be a valid title")
      end
    end
  end
end
