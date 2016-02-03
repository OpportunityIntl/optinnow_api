module OptINnow
  module Commands
    def find_donors(params_hash={})
      response = @connection.get("donors") do |req|
        req.params = params_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('donor', response)
    end
    
    def get_donor(id)
      response = @connection.get("donors/#{id}") do |req|
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('donor', response)
    end
    
    def create_donor(donor_hash)
      response = @connection.post("donors") do |req|
        req.body = {}
        req.body['donor'] = donor_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('donor', response)
    end
    
    def update_donor(donor_id, donor_hash)
      response = @connection.put("donors/#{donor_id}") do |req|
        req.body = {}
        req.body['donor'] = donor_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('donor', response)
    end
  end
end
