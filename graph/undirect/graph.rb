#!/usr/bin/env ruby
#
class Graph
	def initialize f
		lines = File.read(f).split("\n")
		@vertexNum = lines[0].to_i
		@adj = Array.new(@vertexNum) { [] }
		edges = lines[1..-1]
		edges.each do |l|
			addEdge(l.split[0].to_i,l.split[1].to_i)
		end
	end

	def vertexNum
		@vertexNum
	end

	def edgeNum
		@edgeNum
	end

	def adj v
		@adj[v]
	end

    def vertexs
        v = []
        @adj.each_with_index do |l,i|
            v.push(i) if !l.empty?
        end
        v
    end

	def addEdge v1,v2
        #puts "add edge #{v1}-#{v2}"
        @adj[v1].push(v2)
		@adj[v2].push(v1)
	end

    def to_s
        s = "" 
        @adj.each_with_index do |l,i|
            s +=  "#{i} -> #{l.inspect}\n"
        end
        s
    end    
end

# g = Graph.new("data.txt")
# puts g.inspect
# puts g.vetexs.inspect
