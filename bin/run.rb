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
   "2 Watch a Movie from Your Queue",
   "3 Update Username",
   "4 See All Movie Available",
   "5 See All Movies In Queue",
   "6 See All Users Who Viewed A Movie",
   "7 Delete a User",
   "8 Quit"
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


def user_views(user)
  user.show_users_movies
end 

def movie_views
  movie = Movie.find_by(title: get_movie)
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


def pick_movie_from_queue(user)
  input_title = TTY::Prompt.new.select("Select a movie.", user.show_users_queue_titles)
  found_movie = Movie.find_by(title: input_title)
  found_view = user.find_view_by_movie_id(found_movie.id)
  found_view.update(watched: true)
end 




def run_movie_buffs
  prompt = TTY::Prompt.new 
  the_current_user = enter_username
  input = "string"
  until input.chr == "8" do
    menu
    input = prompt.select("Select an option", menu)
    case input.chr
      when "1" 
        the_current_user.reload
        the_current_user.create_view
      when "2"
        pick_movie_from_queue(the_current_user)
      when "3"
        update_username(the_current_user)
      when "4" 
        see_movie_list
      when "5"
        the_current_user.reload
        puts the_current_user.show_users_queue_titles
      when "6" 
        movie_views
      when "7"
        delete_user(the_current_user)
        input = "8"
      when "8"
        puts "Goodbye"
      else 
        puts "Invalid input"
    end 
  end 

  
end 

run_movie_buffs

binding.pry
