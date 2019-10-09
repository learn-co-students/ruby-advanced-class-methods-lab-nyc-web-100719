require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = self.new
    song.save
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
  end

  def self.find_by_name(name)
    #binding.pry
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort { |song1, song2| song1.name <=> song2.name }
  end

  def self.get_artist_from_filename(filename)
    artist_name = filename.split(" - ").first
  end

  def self.get_name_from_filename(filename)
    name = filename.split(" - ").last.chomp(".mp3")
  end

  def self.new_from_filename(filename)
    artist_name = get_artist_from_filename(filename)
    name = get_name_from_filename(filename)
    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end

# binding.pry
# 'h'

