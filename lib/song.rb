require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    Song.all.select{|song| song.name == song_name}.first
  end

  def self.find_or_create_by_name(song_name)
    if Song.find_by_name(song_name)
      Song.find_by_name(song_name)
    else
      Song.create_by_name(song_name)
    end
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    cleaned_filename = Song.clean_filename(filename)
    song = Song.new
    song.artist_name = cleaned_filename[0]
    song.name = cleaned_filename[1]
    song
  end

  def self.clean_filename(filename)
    split_filename = filename.split(' - ')
    split_filename[1].delete_suffix!(".mp3")
    split_filename
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    Song.all.clear
  end
end
