class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
	validate :non_clickbait

	@@clickbait = ["Won't Believe", "Secret", "Top [number", "Guess"
	]

	def non_clickbait
		if self.title && @@clickbait.select {|word| self.title.include? word}.empty?

			errors.add(:title, "Not enough clickbait")
		end
	end 

end
