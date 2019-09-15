class Scary::Scraper

  BASE_URL = "https://editorial.rottentomatoes.com/guide/best-horror-movies-of-all-time/"

  def self.scrape_movies
    doc = Nokogiri::HTML(open(BASE_URL))

    doc.search(".countdown-item").each do |each_movie|

      movie = Scary::Horrorfilms.new

      movie.title = each_movie.search("h2").text
      movie.movie_url = each_movie.search("a").attr("href")
      movie.summary = each_movie.search("div.info.critics-consensus").text.strip      

      movie.save
    end
  end
end