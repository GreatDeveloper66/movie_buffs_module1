class Movie < ActiveRecord::Base
    has_many :views
    has_many :users, through: :views
    
    def show_movies_users
        self.users.uniq.each do |u|
        puts u.name
        end 
    end 

    def find_num_of_views
        self.views.length
    end 

    def self.most_popular_movie
        self.all.max_by do |m|
            m.find_num_of_views
        end 
    end

    def self.movie_views
        movie = self.find_by(title: self.get_movie)
        movie.show_movies_users
    end

    def self.all_movie_titles
       self.all.map do |m|
            m.title 
        end

    end 

    def self.get_movie
        TTY::Prompt.new.select("Select a movie.", self.all_movie_titles)
        
        #input = TTY::Prompt.new.select("Select a movie.", self.all_movie_titles)
        #puts "You've selected #{input}."
        #input
    end 

    def self.see_movie_list
        self.all.each do |m| 
          puts m.title
        end 
    end 


end 