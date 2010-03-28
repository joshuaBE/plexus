module Graphy
  class Graph;                 include GraphBuilder;                 end
  class AdjacencyGraph;        include AdjacencyGraphBuilder;        end
  class DirectedGraph;         include DirectedGraphBuilder;         end
  class Digraph;               include DigraphBuilder;               end
  class DirectedPseudoGraph;   include DirectedPseudoGraphBuilder;   end
  class DirectedMultiGraph;    include DirectedMultiGraphBuilder;    end
  class UndirectedGraph;       include UndirectedGraphBuilder;       end
  class UndirectedPseudoGraph; include UndirectedPseudoGraphBuilder; end
  class UndirectedMultiGraph;  include UndirectedMultiGraphBuilder;  end
end
