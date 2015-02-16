#!/usr/bin/env ruby
require_relative 'graph'

#
# To test if all the graphic edges can all be colored with two different colors.
#

class TwoColor

	def initialize g
		@g = g
		@twoColor = true
		@visited = Array.new(g.vertexNum) { false }
		@colors = Array.new(g.vertexNum) { 0 }
		@g.vertexs.each do |s|
			if (!@visited[s]) then dfs g, s end
		end
	end


	def dfs g,v
		@visited[v] = true
		g.adj(v).each do |w|
			if (!@visited[w])				
				@colors[w] = !@colors[v]
				dfs g, w
			elsif @colors[w] == @colors[v]
				@twoColor = false
			end										
		end
	end

	def isBipartite?
		@twoColor
	end
end

g= Graph.new("data.txt")
cycle = TwoColor.new(g) 
puts cycle.isBipartite? ? "yes,bipartite" : "no,not bipartite "