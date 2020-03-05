
Movie.destroy_all
GetMovie.add_movies

10.times do 
    User.create(name: Faker::Name.unique.name)     
end 
    
new_user_ids = User.all.map do |u|
    u.id
end 

new_movie_ids = Movie.all.map do |m|
    m.id 
end 

10.times do 
    View.create(user_id: new_user_ids.sample, movie_id: new_movie_ids.sample)
end 
