module OptINnow
  module Commands
    def clear_cache
      response = @connection.post("cache/clear") do |req|
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('cache', response)
    end
  end
end
