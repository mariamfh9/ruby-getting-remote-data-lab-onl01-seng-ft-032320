require 'net/http'
require 'open-uri'
require 'json'

class GetRequester
  
  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"
  
  def get_response_body(URL) 
  uri = URI.parse(URL)
  response = Net::HTTP.get_response_body(uri)
  response.body
  end 
  
  def parse_json
  programs = JSON.parse(self.get_response_body)
  programs.collect do |program|
    program["agency"]  
  end
  end 
  
  
end 
