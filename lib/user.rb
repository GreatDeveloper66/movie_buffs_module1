class User < ActiveRecord::Base
  has_many :views
  has_many :movies, through: :views

  def show_users_movies
    # binding.pry
    self.movies.each do |v|
      puts v.title
    end 
  end 


end
