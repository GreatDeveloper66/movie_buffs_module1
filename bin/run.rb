require_relative '../config/environment'

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
        the_current_user.pick_movie_from_queue
      when "4" 
        Movie.see_movie_list
      when "5"
        the_current_user.reload
        puts the_current_user.show_users_queue_titles
      when "6" 
        Movie.movie_views
      when "7"
        the_current_user.update_username
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
