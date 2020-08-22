class AstanleyCLIProject::Api
    url_1 = RestClient.get("https://api.sportradar.us/nhl/trial/v7/en/seasons/2019/REG/standings.json?api_key=#{ENV['NHL_API_KEY]}")
end