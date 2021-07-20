class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validate :title_sufficiently_clickbait_y
  validates_with CategoryValidator

  def title_sufficiently_clickbait_y
    if title.!include == "Won't Believe" || "Secret"|| "Top [number]" || "Guess"
      errors.add(:title, "Has to be a valid title")
    end
  end
end
