require 'net/http'
require 'open-uri'
require 'json'

#calling GetMovie.add_movies adds 5 movies to movies db
class GetMovie 

  def self.prepare_five_urls
    #starts from url and grabs five urls starting from this url imbd id
    #outputs them as an array of five urls
    url_array = []
    url = "http://www.omdbapi.com/?apikey=63beffa4&i=tt1051909"
    i = 0
    while i < 5 do 
        url_array << url
        url = url.succ
        i += 1 
    end 
    url_array
  end

  def self.get_movies
    #pulls in the API info from website and parses them 
    #outputs an array of parsed hashes
    prepare_five_urls.map do |u|
    uri = URI(u)
    movie_data = Net::HTTP.get(uri)
    JSON.parse(movie_data)
    end 
  end 

  def self.add_movies
    #iterate through each movie in the hash and creates a movie instance
    get_movies.each do |api|
        Movie.create(title: api["Title"], genre: api["Genre"],year: api["Year"])
    end 
  end 


end
# binding.pry
# puts 'end'
