require_relative '../config/environment'


def update_username(user_arg)
  puts "Enter your new username:"
  new_name = gets.chomp
  if User.find_by(name: new_name)
    puts "That user already exists."
  else
    User.update(user_arg.id, name: new_name) 
  end 
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

def pick_movie_from_queue(user)
  if user.show_users_queue_titles == []
    puts "Your queue is empty."
  else
  input_title = TTY::Prompt.new.select("Select a movie.", user.show_users_queue_titles)
  found_movie = Movie.find_by(title: input_title)
  found_view = user.find_view_by_movie_id(found_movie.id)
  found_view.update(watched: true)
  end 
end 

def menu 
  [
   "1 Add Movie to Queue",
   "2 Play the Next Movie in Your Queue",
   "3 Select a Movie from Your Queue",
   "4 See All Movies Available",
   "5 See All Movies In Queue",
   "6 See All Users Who Viewed A Movie",
   "7 Update Username",
   "8 Delete a User",
   "9 Quit"
  ]
end 

def run_movie_buffs
  the_current_user = User.enter_username
  input = "string"
  until input.chr == "9" do
    menu
    input = TTY::Prompt.new.select("Select an option", menu)
    case input.chr
      when "1" 
        the_current_user.reload
        the_current_user.create_view
      when "2"
        the_current_user.watch_next_movie_in_queue
      when "3"
        pick_movie_from_queue(the_current_user)
      when "4" 
        see_movie_list
      when "5"
        the_current_user.reload
        puts the_current_user.show_users_queue_titles
      when "6" 
        movie_views
      when "7"
        update_username(the_current_user)
      when "8"
        the_current_user.destroy
        input = "9"
      when "9"
        puts "Goodbye"
      else 
        puts "Invalid input"
    end 
  end 

  
end 

run_movie_buffs

binding.pry
