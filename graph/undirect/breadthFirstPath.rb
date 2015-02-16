#!/usr/bin/env ruby
require 'thread'  #for Queue
require_relative 'graph'

# Breadth First Shortest Path
#
# it solves following two queries:
# 1. if there is a path to vertex v , from the source vertex
# 2. if the path exsits, what is the _shortest_ path

class BreadthFirstShortestPath
	def initialize g, s
		@g = g
		@s = s
		@q = Queue.new
		@visited = Array.new(@g.vertexNum) {false}
		@edgeTo = Array.new(@g.vertexNum)
		bfs @g, @s
	end

	def hasPathTo d
		@visited[d] == true
	end

	def shortestPathTo d
		return nil if !hasPathTo(d)
		p = []
		n = d
		while (n != @s) do
			p.push(n)
			n = @edgeTo[n]
		end
		p.push(@s)
	end

	def bfs g ,s 
		@q.enq(s)
		while (!@q.empty?) do 
			v = @q.deq
			@visited[v] = true
			g.adj(v).each do |w|
				if (!@visited[w])
					@q.enq(w)
					@edgeTo[w]=v
				end
			end
	end
	end
end

g= Graph.new("data.txt")
path = BreadthFirstShortestPath.new(g,0) 
g.vetexs.each do |w|
    to = path.hasPathTo(w)
    if to == true
        puts "has path to #{w} : #{path.shortestPathTo(w).inspect}"
    else
        puts "no path to #{w}"
    end
end