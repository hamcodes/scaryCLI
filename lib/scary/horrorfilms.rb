class Scary::Horrorfilms
  attr_accessor :title, :info, :score, :summary, :movie_url, :year

  @@all = []

  def open_in_browser
    system("open '#{movie_url}'")
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end