module OptINnow
  module Commands
    def find_fundraisers(params_hash={})
      response = @connection.get("fundraisers") do |req|
        req.params = params_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('fundraiser', response)
    end
    
    def get_fundraiser(id)
      response = @connection.get("fundraisers/#{id}") do |req|
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('fundraiser', response)
    end
    
    def create_fundraiser(fundraiser_hash)
      response = @connection.post("fundraisers") do |req|
        req.body = {}
        req.body['fundraiser'] = fundraiser_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('fundraiser', response)
    end
    
    def update_fundraiser(fundraiser_id, fundraiser_hash)
      response = @connection.put("fundraisers/#{fundraiser_id}") do |req|
        req.body = {}
        req.body['fundraiser'] = fundraiser_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('fundraiser', response)
    end
  end
end
