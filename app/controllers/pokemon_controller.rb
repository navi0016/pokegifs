class PokemonController < ApplicationController

  def index

    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/pikachu/")

    body = JSON.parse(response.body)

    puts body["name"] # should be "pikachu"

    render json: {"message": "ok"}
  end

  def show
    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(response.body)
    name  = body["name"]

    render json: {
      "id":25,
      "name":"pikachu",
      "types":["electric"]
    }

  end
end
