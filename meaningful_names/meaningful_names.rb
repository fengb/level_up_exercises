# Here's a terrible method!
def find_random_local_songs
    random_songs = []
    if current_users_around.empty?
      result = "Sorry! No users around right now!"
    else
      current_users_around.each do |user|
        unless user.playlists.empty?
          @playlist = user.playlists.sample
          unless @playlist.songs.empty?
            song = @playlist.songs.sample
            random_songs << song
          end
        end
      end
      return random_songs
    end

# Here's a refactor!
def no_nearby_users?
  if current_users_around.empty?
    raise "Sorry! No users around right now!"
  end
end

def find_random_local_songs
  songs = []
  current_users_around.each do |user|
    songs << user.playlists.songs.sample
  end
  songs
end

def build_local_playlist
  unless no_nearby_users?
    @playlist << 3.times do { find_random_local_songs }
  end
  @playlist.uniq!
end
