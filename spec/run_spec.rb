require_relative '../config/environment'


#you should be able to create a username
#you should be able to find your username if it already exists

describe "Create or find a username" do 
    it 'creates a username' do
        beverly = User.new(name: "Beverly")
        expect(beverly.name).to eq("Beverly") 
    end 
end

describe "Updates a user's name" do 
    it 'Updates username' do 
        greg = User.create(name: "Greg")
        
    end 
end 

describe "See all movie titles" do 
    it 'returns all movie titles' do
        movie_array = Movie.all_movie_titles 
        expect(movie_array.class).to eq(Array)
        expect(movie_array.first.class).to eq(String)
    end 
end 

