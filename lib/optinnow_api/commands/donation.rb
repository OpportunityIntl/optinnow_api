module OptINnow
  module Commands
    def find_donations(params_hash={})
      response = @connection.get("donation") do |req|
        req.params = params_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('donation', response)
    end
    
    def get_donation(id)
      response = @connection.get("donation/#{id}") do |req|
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('donation', response)
    end
    
    def create_donation(donation_hash)
      response = @connection.post("donation") do |req|
        req.body = {}
        req.body['donation'] = donation_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('donation', response)
    end
    
    def update_donation(donation_id, donation_hash)
      response = @connection.put("donation/#{donation_id}") do |req|
        req.body = {}
        req.body['donation'] = donation_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('donation', response)
    end
  end
end
