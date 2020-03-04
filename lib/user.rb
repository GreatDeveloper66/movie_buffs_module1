class User < ActiveRecord::Base
  has_many :views
  has_many :movies, through: :views

  def show_users_movies
    # binding.pry
    self.movies.each do |v|
      puts v.title
    end 
  end 

  def show_watched_movies
    self.movies.select do |m|
      m.watched 
    end

  end

  def show_unwatched_movies
    self.movies.select do |m|
      !m.watched 
    end
  end

end
