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
    song = self.new
    song.save
     
    return song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
     
    return song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    
    return song
  end
  
  def self.find_by_name(name) 
    result = @@all.find{|song| song.name == name}
    return result
  end
  
  def self.find_or_create_by_name(name)
    result = find_by_name(name)
    if (result)
      return result
    else
      create_by_name(name)
    end
  end
  
  def self.alphabetical
    return @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    filename = filename.split(".mp3")
    result = filename[0].split(" - ")
    
    song = self.new
    song.artist_name = result[0]
    song.name = result[1]
    
    return song
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
  
  def self.destroy_all 
    @@all.clear
  end
end
