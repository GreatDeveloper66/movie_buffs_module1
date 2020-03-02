require_relative '../config/environment'

quit = false
while quit != 'q' do
  puts "What genre of movies are your interested in?"
  genre = gets.chomp
  puts genre
  puts "Would you like to quit?"
  quit = gets.chomp
end
