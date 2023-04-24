require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/album'
# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
repo = AlbumRepository.new
albums = repo.all
# Print out each record from the result set .
albums.each do |record|
  p record.title
end