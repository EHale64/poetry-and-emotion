class ToneService

  def get_tone(lines)
    response = conn.get("/v3/tone?version=2017-09-21&text=#{lines}")
    tones = JSON.parse(response.body, symbolize_names: true)
    tones.each do |tone|
      tone[1].each do |tones|
        require "pry"; binding.pry
        tones.map do |tone_info|
          tone_info[:tone_name]
        end
      end
    end
  end

  private

  def conn
    Faraday.new(url: ENV['TONE_ANALYZER_URL']) do |connection|
      connection.basic_auth('apikey', ENV['TONE_ANALYZER_API_KEY'])
    end
  end
end
