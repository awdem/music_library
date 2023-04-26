require 'album_repository'
require 'album'
def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

RSpec.describe AlbumRepository do
  before(:each) do 
    reset_albums_table
  end

  it 'returns the array of artists as objects' do
    repo = AlbumRepository.new

    albums = repo.all
    
    expect(albums.length).to eq 2
    
    expect(albums[0].id).to eq '1'
    expect(albums[0].title).to eq  'The Soft Bulletin'
    expect(albums[0].release_year).to eq '1999'
    expect(albums[0].artist_id).to eq '1'
    
    expect(albums[1].id).to eq '2'
    expect(albums[1].title).to eq 'Mezzanine'
    expect(albums[1].release_year).to eq '1998'
    expect(albums[1].artist_id).to eq '2'    
  end

  it 'finds an specific album and returns it' do
    repo = AlbumRepository.new

    album = repo.find(1)
    
    expect(album.id).to eq '1'
    expect(album.title).to eq 'The Soft Bulletin'
    expect(album.release_year).to eq '1999'
    expect(album.artist_id).to eq '1'   
  end

  # fail state for finding a non-existent record?
  
  it "creates a new artist and adds it to the artists table" do
    repository = AlbumRepository.new

    album = Album.new
    album.title = 'Trompe le Monde'
    album.release_year = 1991
    album.artist_id = 1
    
    repository.create(album)
    
    latest_album = repository.all.last
    expect(latest_album.title).to eq 'Trompe le Monde'    
    expect(latest_album.release_year).to eq '1991'   
    expect(latest_album.artist_id).to eq '1' 
  end
end