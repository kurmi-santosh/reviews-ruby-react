# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
movies = Movie.create([
    {
        name: "Maga dheera",
        image_url: "https://upload.wikimedia.org/wikipedia/en/c/ce/Magadheera_Poster.jpg"
    },
    {
        name: "Racha",
        image_url: "https://en.wikipedia.org/wiki/Racha_%28film%29#/media/File:Racha_poster.jpg"
    },
    {
        name: "Ranga Sthalam",
        image_url: "https://upload.wikimedia.org/wikipedia/en/5/5d/Rangasthalam.jpg"
    }
])

reviews = Review.create([
    {
        title: "Best movie",
        description: "RC acting is very nice",
        score: 4,
        movie: movies.first
    },
    {
        title: "Good movie",
        description: "Director is good",
        score: 5,
        movie: movies.first
    },
    {
        title: "Average movie",
        description: "Director is not good",
        score: 2,
        movie: movies.last
    }
])
