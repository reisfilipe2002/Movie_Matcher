class ChatsController < ApplicationController
  def create
    chat_service = ChatService.new
    favs = ""
    current_user.favourite_movies.each_with_index do |favorite_movie, index|
      favs = "#{favs}
      #{index + 1}. #{favorite_movie.movie.title}"
    end
    if params[:genre].present? && params[:duration].present?
      @message = "This is an app focused on film recommendations, integrated with the ChatGPT API and the TMDB API, which contains a myriad of film entries. You can reference data from https://www.imdb.com since the data is almost the same.  We will focus on the following parameters: title, year, director, main cast, awards, rating, runtime, genre. Your job will be generating a 5 film recommendations based on our users favorite movies list and other optional criteria.
      Here are some guidelines:
      1. Never recommend a film that is on the list provided to you, the user has already watched it.
      2. The order of the user list matters. The highest a film is on the list, the more the user likes it, so try  to prioritize films that match with their top movies.
      3. The recommendations you generate must always include a film that is a a suboptimal match, in order to generate variety, but that suboptimal match should never occupy the top 3 position.
      4. Always include at least one older film (from 1920-1960) but it should never occupy the top 3 position unless the user has a preference for older films.
      5. Prioritize recommending genres that match the user's list most represented genres on their favorite films list.
      Given the what was outlined above, and given the following list of films and questions, generate me a set of 20 recommendations.
      Favorite films:
      #{favs}
      Always rember to be aware of the following:
      Additional criteria:
      1. Q. What genre you want to watch today?
      A. #{params[:genre]}
      2. Q. How important is the duration of the movie for you?
      A. #{params[:duration]}
      No matter what I want your answer to be only a list! Always formated like this(This is very important) with only the titles of the movies:
      1.Title of the movie;
      2.Title of the movie;
      3.Title of the movie;
      4.Title of the movie;
      5.Title of the movie;
      6.Title of the movie;
      7.Title of the movie;
      8.Title of the movie;
      9.Title of the movie;
      10.Title of the movie;
      11.Title of the movie;
      12.Title of the movie;
      13.Title of the movie;
      14.Title of the movie;
      15.Title of the movie;
      16.Title of the movie;
      17.Title of the movie;
      18.Title of the movie;
      19.Title of the movie;
      20.Title of the movie;"
      @response = chat_service.chat(@message)
      titles = @response.scan(/\d+\. (.+)/).flatten
      movies = [ ]
      titles.each do |title|
        movie_results = Tmdb::Movie.search(title)
        movie_id_tmdb = movie_results.first.id
        posters = Tmdb::Movie.images(movie_id_tmdb)["posters"]
        info = Tmdb::Movie.detail(movie_id_tmdb)
        movies << {
          title: title,
          poster_url: "https://image.tmdb.org/t/p/w300#{posters.first['file_path']}",
          year: info["release_date"].split("-")[0],
          rating: info["vote_average"],
          runtime: info["runtime"],
          synopsis: info["overview"],
          genre: info["genres"].first["name"]
        }
      end
      render json: { movies: }
    end
  end
end
