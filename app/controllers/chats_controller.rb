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
      Given the what was outlined above, and given the following list of films and questions, generate me a set of 5 recommendations.
      Favorite films:
      #{favs}
    Additional criteria:
    1. Q. What genre you want to watch today?
    A. #{params[:genre]}
    2. Q. How important is the duration of the movie for you?
    A. #{params[:duration]}
    I want your answer to be a list always formated this way Film: [Recommendation 1]
    Genre: [Genre]
    Year: [Year]
    Director: [Director]
    Main Cast: [Main Cast]
    Awards: [Awards]
    Rating: [Rating]
    Runtime: [Runtime] minutes"
      @response = chat_service.chat(@message)
      render plain: @response
    end
  end
end
