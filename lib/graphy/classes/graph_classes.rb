module Graphy
  # A generic {GraphBuilder Graph} class you can inherit from.
  class Graph;                 include GraphBuilder;                 end

  # A generic {AdjacencyGraphBuilder AdjacencyGraph} class you can inherit from.
  class AdjacencyGraph;        include AdjacencyGraphBuilder;        end

  # A generic {DirectedGraphBuilder DirectedGraph} class you can inherit from.
  class DirectedGraph;         include DirectedGraphBuilder;         end

  # A generic {DigraphBuilder Digraph} class you can inherit from.
  class Digraph;               include DigraphBuilder;               end

  # A generic {DirectedPseudoGraphBuilder DirectedPseudoGraph} class you can inherit from.
  class DirectedPseudoGraph;   include DirectedPseudoGraphBuilder;   end

  # A generic {DirectedMultiGraphBuilder DirectedMultiGraph} class you can inherit from.
  class DirectedMultiGraph;    include DirectedMultiGraphBuilder;    end

  # A generic {UndirectedGraphBuilder UndirectedGraph} class you can inherit from.
  class UndirectedGraph;       include UndirectedGraphBuilder;       end

  # A generic {UndirectedPseudoGraphBuilder UndirectedPseudoGraph} class you can inherit from.
  class UndirectedPseudoGraph; include UndirectedPseudoGraphBuilder; end

  # A generic {UndirectedMultiGraphBuilder UndirectedMultiGraph} class you can inherit from.
  class UndirectedMultiGraph;  include UndirectedMultiGraphBuilder;  end
end
