class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :must_be_clickbait,
           unless: Proc.new{|attr| attr.title.blank?}

  def must_be_clickbait
    unless clickbait_titles.any? {|clickbait_title| title.match(clickbait_title)}
      errors.add(:title, "is not clickbait-y enough")
    end
  end

  def clickbait_titles
    ["Won't Believe", "Secret", /Top\s[0-9]+/, "Guess"]
  end
end
