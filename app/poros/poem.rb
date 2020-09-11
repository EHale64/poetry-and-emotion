class Poem

  def self.get_poems(author)
    poetry_service = PoetryService.new
    poem_params = poetry_service.poems(author).first(10)

    poem_params.map do |poem|
      Poem.new(poem)
    end
  end

  # def self.get_tone(lines)
  #   tone_service = ToneService.new
  #   tone_service.get_tone(lines)
  # end

  attr_reader :title, :author, :lines, :tone

  def initialize(poem_params)
    @title = poem_params['title']
    @author = poem_params['author']
    @lines = poem_params['lines'].join
    # @tone = Poem.get_tone(@lines)
  end
end
