class SearchController < ApplicationController
  def index
    author = params[:author]
    @poems = Poem.get_poems(author)
  end
end
