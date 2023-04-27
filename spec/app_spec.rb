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
          .with("Welcome to the music library manager!").ordered   
        expect(io_dbl).to receive(:puts)
          .with("\nWhat would you like to do?").ordered   
        expect(io_dbl).to receive(:puts)
          .with("1 - List all albums").ordered   
        expect(io_dbl).to receive(:puts)
          .with("1 - List all artists").ordered   
        expect(io_dbl).to receive(:p)
          .with("Enter your choice: ").ordered   
    
      app.run
    end

    context "when the user chooses 1 - List all albums" do
      it 'lists all albums' do
        io_dbl = double :Kernel
        album_repository_dbl = double :album_repository
        artist_repository_dbl = double :artist_repository
        app = Application.new('music_library_test', io_dbl, album_repository_dbl, artist_repository_dbl)
        
        album_list = '
        * 1 - Doolittle
        * 2 - Surfer Rosa
        * 3 - Waterloo
        * 4 - Super Trouper
        * 5 - Bossanova
        * 6 - Lover
        * 7 - Folklore
        * 8 - I Put a Spell on You
        * 9 - Baltimore
        * 10 -	Here Comes the Sun
        * 11 - Fodder on My Wings
        * 12 -	Ring Ring
        '
        expect(io_dbl).to receive(:puts)
          .with("Welcome to the music library manager!").ordered   
        expect(io_dbl).to receive(:puts)
          .with("\nWhat would you like to do?").ordered   
        expect(io_dbl).to receive(:puts)
          .with("1 - List all albums").ordered   
        expect(io_dbl).to receive(:puts)
          .with("1 - List all artists").ordered   
        expect(io_dbl).to receive(:p)
          .with("Enter your choice: ").ordered          
        expect(@io_dbl).to receive(:gets)
          .with('1')
          .and_return(album_list).ordered

        app.run
      end
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