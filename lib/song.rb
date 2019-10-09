require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end
  def self.all
    @@all
  end

  def self.create
    @song = self.new 
    self.all << @song 
    @song  
  end

  def self.new_by_name(name)
    new_song= self.create
    new_song.name = name 
    return new_song
  end 
  def self.create_by_name(name)
    new_song = self.new_by_name(name)
  end
  def self.find_by_name(name)
    self.all.find do |song|
      song.name==name 
    end 
  end 
  def self.find_or_create_by_name(name)
    song=self.find_by_name(name)
    if song == nil
      song = self.create_by_name(name)
      return song 
    end
    return song 
  end 
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end 
  def self.new_from_filename(file)
    arr1 = file.split(" - ")
    arr2 = arr1[1].split(".")
    name = arr2[0]
    song = self.find_or_create_by_name(name)
    song.artist_name = arr1[0]
    return song
  end 
  def self.create_from_filename(file)
    self.new_from_filename(file)
  end 
  def self.destroy_all
    self.all.clear
  end 
end
