require 'app_test'
def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end


RSpec.describe Application do
  before(:each) do 
    reset_albums_table
  end
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
        expect(io_dbl).to receive(:print)
          .with("Enter your choice: ").ordered   
        expect(io_dbl).to receive(:gets)
          .and_return ('choice')    
      app.run
    end

    context "when the user chooses 1 - List all albums" do
      it 'lists all albums' do
        io_dbl = double :Kernel
        album_repository_dbl = double :album_repository
        album1 = double :album, title: 'The Soft Bulletin'
        album2 = double :album, title: 'Mezzanine' 
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
        expect(io_dbl).to receive(:print)
          .with("Enter your choice: ").ordered          
        expect(io_dbl).to receive(:gets)
          .and_return('1').ordered
        expect(album_repository_dbl).to receive(:all)
          .and_return([album1, album2]).ordered
        expect(io_dbl).to receive(:puts)
          .with("* 1 - The Soft Bulletin").ordered
        expect(io_dbl).to receive(:puts)
          .with("* 2 - Mezzanine").ordered
        
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