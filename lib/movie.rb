class Movie < ActiveRecord::Base
    has_many :views
    has_many :users, through: :views
    
    def show_movies_users
        self.users.each do |u|
        puts u.name
        end 
    end 


end 