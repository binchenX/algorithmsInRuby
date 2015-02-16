#!/usr/bin/env ruby
require_relative 'graph'

#single source connectivity 
#print out all the vertex reachable from the source vetex
class DepthFirstSearch

	def initialize g, s 
		@g = g
		@visited = Array.new(g.vertexNum) { false }
		@count = 0 #number of reachable vetext
		dfs g, s
	end


	def dfs g,v
		@visited[v] = true
		@count += 1
		g.adj(v).each do |w|
			if (!@visited[w])
				dfs g, w
			end			
		end
	end


	def connectedVertext
		@g.vertexs.select { |v| @visited[v] == true }
	end

end

g= Graph.new("data.txt")
search = DepthFirstSearch.new(g,0) 
puts search.connectedVertext.inspect

search = DepthFirstSearch.new(g,9) 
puts search.connectedVertext.inspect



