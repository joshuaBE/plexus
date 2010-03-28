# Graphy. A framework for graph theory, graph data structures and associated algorithms.

Graph algorithms currently provided are:

* Topological Sort
* Strongly Connected Components 
* Transitive Closure
* Rural Chinese Postman
* Biconnected

These are based on more general algorithm patterns:

* Breadth First Search 
* Depth First Search 
* A* Search
* Floyd-Warshall
* Best First Search
* Djikstra's Algorithm
* Lexicographic Search

## A quick Tour

### Arcs

There are two vertices bound classes, `Graphy::Arc` and `Graphy::Edge`. The
former defines directional edges, the latter undirected edges.

### Vertices

Vertices can be any `Object`.

### Graph Types

There are a number of different graph types, each of which provide
different features and constraints:

`Graphy::Digraph` and its alias `Graphy::DirectedGraph`:

* Single directed edges (arcs) between vertices
* Loops are forbidden

`Graphy::DirectedPseudoGraph`:

* Multiple directed edges (arcs) between vertices
* Loops are forbidden

`Graphy::DirectedMultiGraph`:

* Multiple directed edges (arcs) between vertices
* Loops on vertices

`Graphy::UndirectedGraph`, `Graphy::UndirectedPseudoGraph`, and
`Graph::UndirectedMultiGraph` are similar but all edges are undirected.

### Data Structures

In order to modelize data structures, make use of the `Graphy::AdjacencyGraph`
module which provides a generalized adjacency list and an edge list adaptor.

The `Graphy::Digraph` class is the general purpose "swiss army knife" of graph
classes, most of the other classes are just modifications to this class.
It is optimized for efficient access to just the out-edges, fast vertex
insertion and removal at the cost of extra space overhead, etc.

## Example Usage

Using IRB, first require the library:

    require 'rubygems' # only if you are using ruby 1.8.x
    require 'graphy'

If you'd like to include all the classes in the current scope (so you
don't have to prefix with `Graphy::`), just:

    include Graphy

Let's play with the library a bit in IRB:

    >> dg = Digraph[1,2, 2,3, 2,4, 4,5, 6,4, 1,6]
    => Graphy::Digraph[[2, 3], [1, 6], [2, 4], [4, 5], [1, 2], [6, 4]] 

A few properties of the graph we just created:

    >> dg.directed?
    => true
    >> dg.vertex?(4)
    => true
    >> dg.edge?(2,4)
    => true
    >> dg.edge?(4,2)
    => false
    >> dg.vertices
    => [1, 2, 3, 4, 5, 6]

Every object could be a vertex, even the class object `Object`:

    >> dg.vertex?(Object)
    => false

    >> UndirectedGraph.new(dg).edges.sort.to_s
    => "[Graphy::Edge[1,2,nil], Graphy::Edge[2,3,nil], Graphy::Edge[2,4,nil],
         Graphy::Edge[4,5,nil], Graphy::Edge[1,6,nil], Graphy::Edge[6,4,nil]]"

Add inverse edge `(4-2)` to directed graph:

    >> dg.add_edge!(4,2)
    => Graphy::DirectedGraph[Graphy::Arc[1,2,nil], Graphy::Arc[1,6,nil], Graphy::Arc[2,3,nil],
                             Graphy::Arc[2,4,nil], Graphy::Arc[4,5,nil], Graphy::Arc[4,2,nil],
                             Graphy::Arc[6,4,nil]]

`(4-2) == (2-4)` in the undirected graph (4-2 doesn't show up):

    >> UndirectedGraph.new(dg).edges.sort.to_s
    => "[Graphy::Edge[1,2,nil], Graphy::Edge[2,3,nil], Graphy::Edge[2,4,nil],
         Graphy::Edge[4,5,nil], Graphy::Edge[1,6,nil], Graphy::Edge[6,4,nil]]"

`(4-2) != (2-4)` in directed graphs (both show up):

    >> dg.edges.sort.to_s
    => "[Graphy::Arc[1,2,nil], Graphy::Arc[1,6,nil], Graphy::Arc[2,3,nil],
         Graphy::Arc[2,4,nil], Graphy::Arc[4,2,nil], Graphy::Arc[4,5,nil],
         Graphy::Arc[6,4,nil]]"

    >> dg.remove_edge! 4,2
    => Graphy::DirectedGraph[Graphy::Arc[1,2,nil], Graphy::Arc[1,6,nil], Graphy::Arc[2,3,nil],
                             Graphy::Arc[2,4,nil], Graphy::Arc[4,5,nil], Graphy::Arc[6,4,nil]]

Topological sorting is realized with an iterator:

    >> dg.topsort         
    => [1, 6, 2, 4, 5, 3]
    >> y = 0; dg.topsort { |v| y += v }; y
    => 21

You can use DOT to visualize the graph:

    >> require 'graphy/dot'
    >> dg.write_to_graphic_file('jpg','visualize')

Here's an example showing the module inheritance hierarchy:

    >> module_graph = Digraph.new
    >> ObjectSpace.each_object(Module) do |m|
    >>   m.ancestors.each {|a| module_graph.add_edge!(m,a) if m != a} 
    >> end
    >> gv = module_graph.vertices.select {|v| v.to_s.match(/Graphy/) }
    >> module_graph.induced_subgraph(gv).write_to_graphic_file('jpg','module_graph')

Look for more in the examples directory.
 
## History

This library is based on [GRATR][1] by Shawn Garbett (itself a fork of
Horst Duchene's [RGL][2] library) which is heavily influenced by the [Boost][3]
Graph Library (BGL).

This fork attempts to modernize and extend the API and tests.

## References

For more information on Graph Theory, you may want to read:

* the [documentation][3] for the Boost Graph Library
* [the Dictionary of Algorithms and Data Structures][4]

## Credits

See CREDITS.markdown

## TODO

See TODO.markdown

## CHANGELOG

See CHANGELOG.markdown

## License

See LICENSE

[1]: http://gratr.rubyforge.org
[2]: http://rgl.rubyforge.org
[3]: http://www.boost.org/libs/graph/doc
[4]: http://www.nist.gov/dads/HTML/graph.html

