module Graphy
  module InitArray
    # using my helper:
    extends_host_with :ClassMethods

    module ClassMethods
      def self.[](*a)
        puts self
        self.new.from_array(*a)
      end
    end
  end
end
