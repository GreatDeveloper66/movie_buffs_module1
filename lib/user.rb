class User < ActiveRecord::Base
  has_many :views
  has_many :movies, through: :views


  def create_view
    movie = Movie.find_by(title: get_movie)
    new_view = View.create(user_id: self.id, movie_id: movie.id)
    # binding.pry
    # User.views << new_view
  end 

  def show_users_movies
    # binding.pry
    self.movies.each do |v|
      puts v.title
    end 
  end 

  def show_users_queue
    self.views.map do |v|
       v.movie if !v.watched
    end 
  end 

  def show_users_queue_titles
    self.show_users_queue.map do |v|
      v.title
    end
  end 



  def show_users_watched
    self.views.map do |v|
      puts v.movie if v.watched
    end 
  end 






  # def show_watched_movies
  #   self.views.select do |v|
  #     v.watched 
  #   end

  # end

  # def show_unwatched_movies
  #   self.views.select do |v|
  #     !v.watched 
  #   end
  # end

  # def show_unwatched_movie_titles
  #   self.show_unwatched_movies.map do |m|
  #     m.title
  #   end 
  # end 

  # def show_watched_movie_titles
  #   self.show_watched_movies.map do |m|
  #     m.title
  #   end 
  # end 


end
