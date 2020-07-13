require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort{|a, b| a.name <=> b.name}
  end


  # Thundercat - For Love I Come.mp3
  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(/[-,.]/)[0].strip
    song.name = filename.split(/[-,.]/)[1].strip
    song
  end


  # Thundercat - For Love I Come.mp3
  def self.create_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(/[-,.]/)[0].strip
    song.name = filename.split(/[-,.]/)[1].strip
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end


end

# Song.create_by_name("Blank Space")
# Song.create_by_name("other")
# Song.alphabetical
