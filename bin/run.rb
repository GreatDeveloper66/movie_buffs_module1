require_relative '../config/environment'
ActiveRecord::Base.logger = nil


def menu 
  [
   "1 Add Movie to Queue",
   "2 Play the Next Movie in Your Queue",
   "3 Select a Movie from Your Queue",
   "4 See All Movies Available",
   "5 See All Movies In Queue",
   "6 See All Users Who Viewed A Movie",
   "7 See the Most Popular Movie",
   "8 Update Username",
   "9 Delete a User",
   "Quit"
  ]
end 

def run_movie_buffs
  movie_buffs_animation
  the_current_user = User.enter_username
  input = "string"
  until input.chr == "Q" do
    menu
    input = TTY::Prompt.new.select("Select an option", menu, per_page: 10)
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
        popular_movie = Movie.most_popular_movie
        puts "#{popular_movie.title} is the most popular with #{popular_movie.find_num_of_views} views."
      when "8"
        the_current_user.update_username
      when "9"
        the_current_user.destroy
        input = "Q"
      when "Q"
        puts "Goodbye"
    end 
  end 

  
end 

run_movie_buffs

