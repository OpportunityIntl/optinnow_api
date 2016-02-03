module OptINnow
  module Response
    class Wrapper
      attr_reader :errors, :status, :resource_type
      
      def initialize(resource_type, response)
        @status = response.status
        @resource_type = resource_type
        @success = (200..299).include? @status
        
        attrs = normalize_response_body(response.body)
        
        if (@success)
          if attrs.class == Array
            resources = Array.new
            attrs.each do |attribute|
              resources << OptINnow::Response::Object.new(attribute[resource_type])
            end
            
            class_eval { attr_accessor resource_type.pluralize}
            instance_variable_set "@#{resource_type.pluralize}", resources
          else
            class_eval { attr_accessor resource_type}
            instance_variable_set "@#{resource_type}", OptINnow::Response::Object.new(attrs[resource_type])
          end
        else 
          normalize_error_messages(attrs)
        end
      end
      
      def success?
        @success
      end
      
      private
      
      def normalize_response_body(body)
        if body.present?
          begin
            attrs = JSON.parse(body)
          rescue
            attrs = {}
            attrs['optinnow'] = body
          end
        else
          attrs = {}
        end
        attrs
      end
      
      def normalize_error_messages(attrs)
        @errors = {}
        
        if @status == 404
          @errors[@resource_type] = 'not found'
        elsif @status == 500
          @errors['optinnow'] = 'server error'
        else
          attrs.each do |key, value|
            @errors[key] = value
          end
        end
      end
    end
  end
end
