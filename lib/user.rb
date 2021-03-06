class User < ActiveRecord::Base
  has_many :views
  has_many :movies, through: :views

  def self.enter_username
    username = TTY::Prompt.new.ask("Welcome to Movie Buffs, enter your username:")
    new_user = self.find_or_create_by(name: username)
  end 

  def update_username
    puts "Enter your new username:"
    new_name = gets.chomp
    if User.find_by(name: new_name)
      puts "That user already exists."
    else
      User.update(self.id, name: new_name) 
    end 
  end 

  # this creates a new view connecting a user id and movie id.
  # watched defaults to false adding this view to a user's queue (watched: false)
  def create_view
    movie = Movie.find_by(title: Movie.get_movie)
    new_view = View.create(user_id: self.id, movie_id: movie.id)
  end 


  # this filters the views showing only showing the views of this user
  def show_users_queue
    self.views.select do |v|
      !v.watched
    end 
  end 

  def watch_next_movie_in_queue
    user_queue = self.show_users_queue
    if user_queue.first
      user_queue.first.update(watched: true)
    else 
      puts "Your queue is empty."
    end 
  end 

  # this maps show_users_queue to give a list of just the titles in this users queue
  # this method is used for TTY prompts
  def show_users_queue_titles
    self.show_users_queue.map do |v|
      v.movie.title
    end
  end 

  def find_view_by_movie_id(mov_id)
    the_views = self.views.select do |v|
      !v.watched
    end 
    the_views.find do |v|
      v.movie_id == mov_id 
    end 
  end 


   #this filters a users views to show only those that have been watched
   # we haven't used this but could be useful for a new feature "watched list"
   def show_users_watched
    self.views.select do |v|
      v.watched
    end 
  end 

  def pick_movie_from_queue
    if self.show_users_queue_titles == []
      puts "Your queue is empty."
    else
    input_title = TTY::Prompt.new.select("Select a movie.", self.show_users_queue_titles)
    found_movie = Movie.find_by(title: input_title)
    found_view = self.find_view_by_movie_id(found_movie.id)
    found_view.update(watched: true)
    end 
  end 

end
