#!/usr/bin/env ruby
require_relative 'digraph'


#reachability test in directed graph
#1. single source reachability
#2. multi source reachability - mark-sweep gc algorithm

class DirectedDFS
	def initialize g ,s 
		@marked = Array.new(g.vertexNum) { false }
		#multi source or single source
		if s.respond_to?(:each) 
			s.each do |w|
				if (!@marked[w]) then dfs g, w end
			end
		else
			dfs g,s
		end
	end

	def dfs g , v
		@marked[v] = true
		g.adj(v).each do |w|
			if(!@marked[w]) then dfs g, w end
		end
	end

	def reachable v
		@marked[v]
	end
end

g = Digraph.new("data.txt")
dfs = DirectedDFS.new(g,0)
puts g.vertexs.inspect
puts g.vertexs.select { |v| dfs.reachable(v)}.inspect
dfs2 = DirectedDFS.new(g,[0,4,5])
puts g.vertexs.select { |v| dfs2.reachable(v)}.inspect
