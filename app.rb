require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
id = 1
sql = "SELECT id, title, release_year, artist_id FROM albums WHERE id = #{id} "
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
p result.entries