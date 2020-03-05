require_relative '../config/environment'



def enter_username
  username = TTY::Prompt.new.ask("Welcome to Movie Buffs, enter your username:")
  new_user = User.find_or_create_by(name: username)
end 

def menu 
  [
   "1 Add Movie to Queue",
   "2 Watch a Movie from Your Queue",
   "3 See All Movie Available",
   "4 See All Movies In Queue",
   "5 See All Users Who Viewed A Movie",
   "6 Update Username",
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
  TTY::Prompt.new.select("Select a movie.", Movie.all_movie_titles)
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
  the_current_user = enter_username
  input = "string"
  until input.chr == "8" do
    menu
    input = TTY::Prompt.new.select("Select an option", menu)
    case input.chr
      when "1" 
        the_current_user.reload
        the_current_user.create_view
      when "2"
        pick_movie_from_queue(the_current_user)
      when "3" 
        see_movie_list
      when "4"
        the_current_user.reload
        puts the_current_user.show_users_queue_titles
      when "5" 
        movie_views
      when "6"
        update_username(the_current_user)
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
