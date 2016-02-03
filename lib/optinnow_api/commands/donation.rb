module OptINnow
  module Commands
    def create_donation(donation_hash)
      response = @connection.post("donation") do |req|
        req.body = {}
        req.body['donation'] = donation_hash
        req.headers['Authorization'] = @token
      end
      
      OptINnow::Response::Wrapper.new('donation', response)
    end
  end
end
