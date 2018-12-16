class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #creates a new song, saves it, and returns it.
  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name_of_song)
    new_song = self.new #creates a new song
    new_song.name = name_of_song #sets name of song equal to name_of_song
    new_song #returns new song.
  end

  def self.create_by_name(name_of_song)
    new_song = self.create #Uses class method above to create a new song.
    new_song.name = name_of_song
    new_song
  end

  def self.find_by_name(name_of_song)
    self.all.find {|single_song| single_song.name == name_of_song} #find method finds first song with the name provided.
  end

  def self.find_or_create_by_name(name_of_song)
    #first checks to see if song exists, if it does returns.  If not creates a new song.
     self.find_by_name(name_of_song) || self.create_by_name(name_of_song) 
  end

  def self.alphabetical
    #uses built in sort method.
    self.all.sort_by {|single_song| single_song.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    new_song = self.create
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
