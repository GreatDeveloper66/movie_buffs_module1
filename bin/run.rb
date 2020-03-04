require_relative '../config/environment'

#added some more movies to the database and changed #enter_username promp.ask string

def create_username
  input_name = prompt.ask("What is your new username?")
  User.create(name: input_name)
end 

def enter_username
  prompt = TTY::Prompt.new 
  username = prompt.ask("Welcome to Movie Buffs, enter your username:")
  new_user = User.find_or_create_by(name: username)
end 

def menu 
  [
   "1 Add Movie to Queue",
   "2 Update Username",
   "3 See Movie List",
   "4 See Previously Viewed Movies",
   "5 See All Users Who Viewed A Movie",
   "6 Delete a User",
   "7 Quit"
  ]
end 

def get_input
  puts "Select an option using a number."
  gets.chomp
end 

def update_username(user_arg)
  puts "Enter your new username:"
  new_name = gets.chomp
  User.update(user_arg.id, name: new_name) 
end 

def get_movie
  # puts "Enter the movie's title:"
  # # movie_input = gets.chomp
  TTY::Prompt.new.select("Select a movie.", Movie.all_movie_titles)

  # Movie.find_by(title: movie_input)
end 

def create_view(user)
  movie = Movie.find_by(title: get_movie)
  View.create(user_id: user.id, movie_id: movie.id)
end 

def user_views(user)
  user.show_users_movies
end 

def movie_views
  movie = get_movie
  movie.show_movies_users
end

def see_movie_list
  Movie.all.each do |m| 
    puts m.title
  end 
end 

def delete_user(user_obj)
  user_obj.destroy
  
end 

# def run_movie_buffs
#   prompt = TTY::Prompt.new 
#   the_current_user = enter_username
#   input = "string"
#   until input.chr == "7" do
#     menu
#     input = prompt.select("Select an option", menu)
#     case input.chr
#       when "1" 
#         create_view(the_current_user)
#       when "2"
#         update_username(the_current_user)
#       when "3" 
#         see_movie_list
#       when "4"
#         user_views(the_current_user)
#       when "5" 
#         movie_views
#       when "6"
#         delete_user(the_current_user)
#       when "7"
#         puts "Goodbye"
#       else 
#         puts "Invalid input"
#     end 
#   end 

  
# end 

# run_movie_buffs

binding.pry





# binding.pry
# puts "end"



