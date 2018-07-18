require 'pry'

class Song
  
  attr_accessor :name
  @@all = Array.new
  
  def self.create
    song = Song.new
    song.save 
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
  
  def self.find_by_name(name)
    self.all.detect{|x| name == x.name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)  
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(file)
    binding.pry
    self.create_by_name(file.split(" - ").last.gsub(".mp3", "")strip)
  end
  
end

































# require 'pry'
# class Song
#   attr_accessor :name, :artist_name
#   @@all = []

#   def self.all
#     @@all
#   end

#   def save
#     self.class.all << self
#   end

#   def self.create
#     song = self.new
#     song.save
#     song
#   end

#   def self.new_by_name(name)
#     song = self.new
#     song.name = name
#     song
#   end

#   def self.create_by_name(name)
#     song = self.create
#     song.name = name
#     song
#   end

#   def self.find_by_name(song_name)
#     self.all.detect {|song| song.name == song_name}
#   end

#   def self.find_or_create_by_name(song_name)
#     self.find_by_name(song_name) || self.create_by_name(song_name)
#   end
#   # a = false || true
#   # => true
#   # a
#   # => true
#   #
#   # a = false or true
#   # => true
#   # a
#   # => false
#   # self.find_by_name = nil ? self.create_by_name : self.find_by_name

#   def self.alphabetical
#     self.all.sort_by {|a| a.name}
#     #self.all.sort {|a, b| a.name <=> b.name}
#   end

#   def self.new_from_filename(file_name)
#     data = file_name.split(" - ")
#     artist_name = data[0]
#     name = data[1].gsub(".mp3", "")
#     song = self.new
#     song.name = name
#     song.artist_name = artist_name
#     song
#   end

#   def self.create_from_filename(file_name)
#     data = file_name.split(" - ")
#     artist_name = data[0]
#     name = data[1].gsub(".mp3", "")
#     song = self.create
#     song.name = name
#     song.artist_name = artist_name
#     song
#   end

#   def self.destroy_all
#     self.all.clear
#   end
# end
