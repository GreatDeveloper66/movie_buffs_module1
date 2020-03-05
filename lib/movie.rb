class Movie < ActiveRecord::Base
    has_many :views
    has_many :users, through: :views
    
    def show_movies_users
        self.users.each do |u|
        puts u.name
        end 
    end 

    def self.all_movie_titles
        self.all.map do |m|
            m.title 
        end 
    end 

    def self.get_movie
        TTY::Prompt.new.select("Select a movie.", self.all_movie_titles)
    end 


end 