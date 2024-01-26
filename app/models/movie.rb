class Movie < ApplicationRecord
    has_many :reviews

    before_create :sluggify

    def sluggify
        self.slug = name.parameterize
    end

    def average_score
        reviews.average(:score).round(2).to_f
    end
end
