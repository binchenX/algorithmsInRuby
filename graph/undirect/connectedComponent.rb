#!/usr/bin/env ruby
require_relative 'graph'

#
#
#1. print out the connected components in the graph
#2. test if two vertex are connect
# 
class ConnectedComponents

	def initialize g
		@g = g
		@marked = Array.new(g.vertexNum) { false }
		@id = Array.new(g.vertexNum)
		@count = 0
		g.vertexs.each do |v|
			if (!@marked[v]) 
				dfs g,v 
				@count += 1
			end
		end
	end

	def dfs g ,v 
		@id[v] = @count
		@marked[v] = true
		g.adj(v).each do |w|
			if (!@marked[w]) then dfs g, w end
		end
	end

	def getConnectedComponents
		c = Array.new(@count) { [] }
		@g.vertexs.each do |v|
			c[@id[v]] << v
		end
		c
	end

	def isConnected  v1, v2
		@id[v1] == @id[v2]
	end
end



g= Graph.new("data.txt")
cc = ConnectedComponents.new(g) 
cc.getConnectedComponents.each do |c|
	puts c.inspect
end
