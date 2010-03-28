module Graphy

  module DirectedGraphBuilder
    include GraphBuilder
    
    autoload :Algorithms, "graphy/directed_graph/algorithms"
    autoload :Distance,   "graphy/directed_graph/distance"    

    # FIXME: DRY this snippet, I didn't find a clever way to
    # to dit though
    # TODO: well, extends_host_with do ... end would be cool,
    # using Module.new.module_eval(&block) in the helper.
    extends_host
    module ClassMethods
      def [](*a)
        self.new.from_array(*a)
      end
    end
    
    def initialize(*params)
      args = (params.pop if params.last.kind_of? Hash) || {}
      args[:algorithmic_category] = DirectedGraphBuilder::Algorithms    
      super *(params << args)
    end
  end # DirectedGraphBuilder
  
  # DirectedGraph is just an alias for Digraph should one desire
  DigraphBuilder = DirectedGraphBuilder

  # This is a Digraph that allows for paral#lel edges, but does not
  # allow loops
  module DirectedPseudoGraphBuilder
    include DirectedGraphBuilder
    extends_host
    module ClassMethods
      def [](*a)
        self.new.from_array(*a)
      end
    end
    
    def initialize(*params)
      args = (params.pop if params.last.kind_of? Hash) || {}
      args[:parallel_edges] = true
      super *(params << args)
    end

  end # DirectedPseudoGraph

  # This is a Digraph that allows for parallel edges and loops
  module DirectedMultiGraphBuilder
    include DirectedPseudoGraphBuilder
    extends_host
    module ClassMethods
      def [](*a)
        self.new.from_array(*a)
      end
    end

    def initialize(*params)
      args = (params.pop if params.last.kind_of? Hash) || {}
      args[:loops] = true
      super *(params << args)
    end
  end # DirectedMultiGraph

end # Graphy
