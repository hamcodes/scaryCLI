class Scary::CLI

  def call
    puts ""
    puts ".........(ʘ_ʘ) Welcome to the Horror Movie List CLI (ʘ_ʘ).........."
    Scary::Scraper.scrape_movies
    puts ""
    puts "According to Rotten Tomatoes, here's a random list of the 10 best horror movies of all time!!!!"
    puts ""
    list
  end

  def list
    movies = Scary::Horrorfilms.all.sample(10)
    movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title}"
    end
    film_list(movies)
  end

  def film_list(movies)
    puts ""
    puts "Want to get scared? Type a number and press enter to take a look at the movies!"
    

    input = gets.strip

    if input.to_i.between?(1, movies.length)
      index = input.to_i - 1
      display_selection(movies[index])
      see_more(movies[index])
    else
      puts "Choose your poison with a number from the list!"
      film_list(movies)
    end
  end

  def display_selection(input)
    puts "#{input.title}"
    # puts "OVERALL SCORE: #{input.score}"
    # puts "YEAR: #{input.year} \n "
    puts "#{input.summary}"
  end

  def see_more(movie)
    puts ""
    puts "Want to be scared even more? Put Y to follow a link to the movie, or put N to go back to the main menu! \n"
    puts "Y/N"
    input = gets.strip
    if ["Y"].include?(input.upcase)
      movie.open_in_browser
    else
      puts "\nChoose your poison with another movie!"
      list
    end
  end

  def goodbye
    puts "See you soon!!!"
  end
end
