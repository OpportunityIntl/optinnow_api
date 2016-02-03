require 'optinnow_api/commands/donor'
require 'optinnow_api/commands/fundraiser'
require 'optinnow_api/commands/donation'
require 'optinnow_api/commands/cache'
require 'optinnow_api/response/wrapper'
require 'optinnow_api/response/object'

module OptINnow
  class Client
    include OptINnow::Commands
    include OptINnow::Response
    
    def initialize(endpoint, api_key)
      @connection = Faraday.new(url: endpoint)
      @token = "Token token=\"#{api_key}\""
    end
  end
end
