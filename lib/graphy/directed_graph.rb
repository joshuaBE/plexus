module Graphy

  module DirectedGraph
    include Graph
    
    autoload :Algorithms, "graphy/directed_graph/algorithms"
    autoload :Distance,   "graphy/directed_graph/distance"    

    #def self.included? base
      ## FIXME: don't understand why but that's not triggered
      ## by include Digraph so the [] class methods is never
      ## added to the receiver :(
      #puts "Digraph included"
      #base.extend(ClassMethods)
    #end

    ## using my helper:
    #extends_host_with :ClassMethods

    module ClassMethods
      def [](*a)
        puts self
        self.new.from_array(*a)
      end
    end
    
    def initialize(*params)
      args = (params.pop if params.last.kind_of? Hash) || {}
      args[:algorithmic_category] = DirectedGraph::Algorithms    
      super *(params << args)
    end
  end # DirectedGraph
  
  # DirectedGraph is just an alias for Digraph should one desire
  Digraph = DirectedGraph

  # This is a Digraph that allows for paral#lel edges, but does not
  ## allow loops
  #module DirectedPseudoGraph
    #include DirectedGraph
    
    #def initialize(*params)
      #args = (params.pop if params.last.kind_of? Hash) || {}
      #args[:parallel_edges] = true
      #super *(params << args)
    #end

  #end # DirectedPseudoGraph

  ## This is a Digraph that allows for parallel edges and loops
  #module DirectedMultiGraph
    #include DirectedPseudoGraph

    #def initialize(*params)
      #args = (params.pop if params.last.kind_of? Hash) || {}
      #args[:loops] = true
      #super *(params << args)
    #end
  #end # DirectedMultiGraph

end # Graphy
