class HogwartsService

  def initialize(house)
    @house = house
  end

  def role_call
    get_json["data"].first["attributes"]["students"]
  end

  private
  
  def conn
    Faraday.new(url: 'http://hogwarts-it.herokuapp.com')
  end

  def response
    conn.get("/api/v1/house/#{@house}?api_key=#{ENV['HOG_API_KEY']}")
  end

  def get_json
    get_json = JSON.parse(response.body)
  end

end
