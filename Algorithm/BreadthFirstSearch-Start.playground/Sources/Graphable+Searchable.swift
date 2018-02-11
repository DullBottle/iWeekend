// Extension for Searchable functions

enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}

extension Graphable {
    public func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]?
    {
        var visits: [Vertex<Element>: Visit<Element>] = [source: .source]
        var queue = Queue<Vertex<Element>>()
        queue.enqueue(source)
        
        while let vistedVertex = queue.dequeue() {
            if vistedVertex == destination {
                var vertex = destination
                var route = [Edge<Element>]()
                
                while let visit = visits[vertex], case .edge(let edge) = visit {
                    route = [edge] + route
                    vertex = edge.source
                }
                
                return route
            }
            let neighbourEdges = edges(from: vistedVertex) ?? []
            for edge in neighbourEdges {
                if visits[edge.destination] == nil {
                    queue.enqueue(edge.destination)
                    visits[edge.destination] = .edge(edge)
                }
            }
        }
        
        return nil
    }
}

















