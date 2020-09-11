class PoetryService
  def poems(author)
    response  = conn.get("/author/#{author}")

    JSON.parse(response.body, symbolize_name: true)
  end

  private

  def conn
    Faraday.new(url: 'https://poetrydb.org')
  end
end
