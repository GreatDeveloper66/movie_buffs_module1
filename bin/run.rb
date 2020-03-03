require_relative '../config/environment'

# quit = 'g'
# while quit != 'q' do
#   puts "Are you a new user?"
#   newuserq = gets.chomp
#   if newuserq == 'y'
#     puts "Please enter your username."
#     username = gets.chomp
#     newuser = User.create(name: username)
#     puts newuser
#   else
#     puts "Goodbye"
#   end
#   puts "Would you like to quit?"
#   quit = gets.chomp
# end


def enter_username
  puts "Welcome, enter your username:"
  username = gets.chomp
  find_user = User.find_by(name: username)
  if find_user
    puts "Hello #{username}"
    find_user
  else 
    puts "#{username} is not in our system. Create a new username."
    create_username
  end 
end 
# the_user = enter_username

def current_user
  
end 

def menu 
  puts "Welcome, here are your options:"
  puts "1 Watch a Movie"
  puts "2 Update Username"
  puts "3 See Movie List"
  puts "4 Delete a Movie Viewing"
end 

def get_input
  puts "Select an option using a number."
  gets.chomp
end 

def create_username
  puts "Type your username."
  input_name = gets.chomp
  User.create(name: input_name)
end 

def update_username
  puts "Enter your new username:"
  new_name = gets.chomp
  
end 

def create_view
  # puts "What is your username?"
  # input_user = gets.chomp 
  # find_user = User.find_by(name: input_user.to_s)
  # if find_user 
  #    this_user_id = find_user.id 
  # else 
  #   new_user = create_username
  #   this_user_id = new_user.id
  # end
  # puts "What movie did you watch?"
  # Movie.id
  # puts "Enter how long you watched the movie:"
  # duration = gets.chomp

end 

def see_movie_list
  Movie.all.each do |m| 
    puts m.title
  end 
end 

see_movie_list

#create view

#update username

#read movie listing Movie.all

#delete viewing