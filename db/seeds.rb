



admin = User.create(email: "admin@email.com", password: "admin", password_confirmation: "admin", is_admin: true)
user_one = User.create(email: "user_one@email.com", password: "my_password", password_confirmation: "my_password")

movie_conditions =[ 'bad', 'fair', 'new' ]

10.times do
  movie = Movie.create(
    name: Faker::Movie.title,
    description: Faker::Lorem.paragraph(random_sentences_to_add: 25),
    rating: rand(0..10)
  )
  10.times do
    Rental.create(
      condition: movie_conditions[rand(0..2)],
      movie_id: movie.id
    )
  end
end  
