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
def create_username
  puts "Type your username:"
  input_name = gets.chomp
  User.create(name: input_name)
end 

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
# the_current_user = enter_username


def menu 
  puts "Welcome, select your option by typing a number:"
  puts "1 Watch a Movie"
  puts "2 Update Username"
  puts "3 See Movie List"
  puts "4 Delete a User"
  puts "5 Quit"
end 

def get_input
  puts "Select an option using a number."
  gets.chomp
end 

def update_username(user_arg)
  puts "Enter your new username:"
  new_name = gets.chomp
  User.update(user_arg.id, name: new_name) 
end 

def get_movie
  puts "Enter the movie's title:"
  movie_input = gets.chomp
  Movie.find_by(title: movie_input)
end 


def create_view(user)
  movie = get_movie
  puts "How long did you watch?"
  duration_input = gets.chomp
  Views.create(user_id: user.id, movie_id: movie.id, duration: duration_input)
end 

def see_movie_list
  Movie.all.each do |m| 
    puts m.title
  end 
end 

def delete_user(user_obj)
  user_obj.destroy
end 


def run_movie_buffs
  the_current_user = enter_username
  input = nil
  until input == "5" do
    menu
    input = gets.chomp
    case input
      when "1" 
        create_view(the_current_user)
      when "2"
        update_username(the_current_user)
      when "3" 
        see_movie_list
      when "4" 
        delete_user(the_current_user)
      when "5"
        puts "Goodbye"
      else 
        puts "Invalid input"
    end 
  end 
  
end 

run_movie_buffs






# binding.pry
# puts "end"



