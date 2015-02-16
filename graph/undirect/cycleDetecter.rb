#!/usr/bin/env ruby
require_relative 'graph'

#
# To test if the graphic has cycle.
#

class CycleDetector

	def initialize g
		@g = g
		@hasCycle = false
		@visited = Array.new(g.vertexNum) { false }
		@g.vertexs.each do |s|
			if (!@visited[s]) then dfs g, s ,s end
		end
	end


	def dfs g,v, u
		@visited[v] = true
		g.adj(v).each do |w|
			if (!@visited[w])
				dfs g, w ,v
			elsif w != u
				@hasCycle = true
			end										
		end
	end

	def hasCycle?
		@hasCycle
	end
end

g= Graph.new("data.txt")
cycle = CycleDetector.new(g) 
puts cycle.hasCycle? ? "has Cycle" : "noCycle"