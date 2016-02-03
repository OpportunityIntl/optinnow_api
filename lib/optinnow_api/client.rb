require 'commands/donor'
require 'commands/fundraiser'
require 'commands/donation'
require 'response/wrapper'
require 'response/object'

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
