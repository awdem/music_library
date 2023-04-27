require 'app_test'

RSpec.describe Application do
  xit "constructs" do
    io_dbl = double :Kernel
    album_repository_dbl = double :album_repository
    artist_repository_dbl = double :artist_repository
    app = Application.new('music_library_test', io_dbl, album_repository_dbl, artist_repository_dbl)
  end

  describe 'Terminal behaviour' do
    it 'welcomes the user and presents two options with a prompt' do
      io_dbl = double :Kernel
      album_repository_dbl = double :album_repository
      artist_repository_dbl = double :artist_repository
      app = Application.new('music_library_test', io_dbl, album_repository_dbl, artist_repository_dbl) 
      
      expect(io_dbl).to receive(:puts)
        .with("Welcome to the music library manager!\n").ordered   
      expect(io_dbl).to receive(:puts)
        .with("What would you like to do?").ordered   
      expect(io_dbl).to receive(:puts)
        .with("1 - List all albums").ordered   
      expect(io_dbl).to receive(:puts)
        .with("1 - List all artists").ordered   
      expect(io_dbl).to receive(:p)
        .with("Enter your choice: ").ordered   
    
      app.run
    end
  end
end





# Terminal behaviour:
# ----------------
# Welcome to the music library manager!

# What would you like to do?
#  1 - List all albums
#  2 - List all artists

# Enter your choice: 1
# [ENTER]

# Here is the list of albums:
#  * 1 - Doolittle
#  * 2 - Surfer Rosa
#  * 3 - Waterloo
#  * 4 - Super Trouper
#  * 5 - Bossanova
#  * 6 - Lover
#  * 7 - Folklore
#  * 8 - I Put a Spell on You
#  * 9 - Baltimore
#  * 10 -	Here Comes the Sun
#  * 11 - Fodder on My Wings
#  * 12 -	Ring Ring