class HogwartsService

  def initialize(house)
    @house = house
  end

  def role_call
    JSON.parse(response.body)
  end

  private

  def conn
    Faraday.new(url: 'https://hogwarts-as-a-service.herokuapp.com')
  end

  def response
    conn.get("/api/v1/house/#{houses[@house]}") do |conn|
      conn.headers['x_api_key'] = ENV['HOG_API_KEY']
    end
  end

  def houses
    #id's pulled from hogwarts-as-a-service api
    {
      "Gryffindor" => 1,
      "Ravenclaw" => 2,
      "Hufflepuff" => 3,
      "Slytherin" => 4
    }

  end

end
