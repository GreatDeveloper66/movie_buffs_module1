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



#menu
def menu 
  puts "Welcome, here are your options:"
  puts "1. Create Username"
  puts "2. Watch a Movie"
  puts "3. Update Username"
  puts "4. See Movie List"
  puts "5. Delete a Movie Viewing"
end 

menu

#create username

#create view

#update username

#read movie listing Movie.all

#delete viewing