module OptINnow
  module Response
    class Object
      def initialize(attrs=nil)
        add_attrs(attrs) if attrs.present?
      end
      
      private
      
      def add_attrs(attrs)
        attrs.each do |var, value|
          class_eval { attr_accessor var }
          instance_variable_set "@#{var}", value
        end
      end
    end
  end
end
