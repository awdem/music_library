class AlbumRepository

  # Selecting all records
  # No arguments
      # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;

    # Returns an array of Student objects.
  def all
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])
    albums = []

    result_set.each do |record|
      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album
    end
    albums
  end

  def find(id)
    sql = "SELECT id, title, release_year, artist_id FROM albums WHERE id = #{id} "
    result = DatabaseConnection.exec_params(sql, [])
    album = Album.new

    result.each do |record|
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']
    end

    album
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;

    # Returns a single album object.
  end

  # def create(album)
    # Executes the SQL query:
    # INSERT INTO albums 
    # (title, release_year, artist_id)
    # VALUES (title, release_year, artist_id)
  # end

  # def update(album)
    # Executes the SQL query:
    # INSERT INTO albums 
    # (title, release_year, artist_id)
    # VALUES (title, release_year, artist_id)  
  # end

  # def delete(album)
  # end


end