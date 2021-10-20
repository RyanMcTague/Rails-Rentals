



admin = User.create(email: ENV["ADMIN_EMAIL"], password: ENV["ADMIN_PASSWORD"], password_confirmation:  ENV["ADMIN_PASSWORD"], is_admin: true)
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
