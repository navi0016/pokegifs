class PokemonController < ApplicationController

  def index
    api_key = ENV["GIFFY_API_KEY"]
    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/pikachu/")
    body = JSON.parse(response.body)

    res_gif = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{api_key}&q=pikachu&rating=g")
    body_gif = JSON.parse(res_gif.body)
    gif_url = body_gif["data"][0]["url"]


    puts = body["name"] # should be "pikachu"

    render json: {"message": "ok"}


  end

  def show
    api_key = ENV["GIFFY_API_KEY"]
    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(response.body)
    name  = body["name"]
    res_gif = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{api_key}&q=#{name}&rating=g")
    body_gif = JSON.parse(res_gif.body)
    gif_url = body_gif["data"][0]["url"]


    render json: {
      "id": params[:id],
      "name": body["name"],
      "types": body["types"].map { |item| item["type"]["name"] },
      "gif": gif_url

    }

  end
end
