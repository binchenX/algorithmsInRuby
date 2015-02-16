#!/usr/env/bin ruby
require_relative 'graph'
#
#
#
#
# Depth First path
#
# it solves following two queries:
# 1. if there is a path to vertex v , from the source vertex
# 2. if the path exsits, what is the path

class DepthFirstPath
	def initialize g, s
		@g = g
		@s = s
		@visited = Array.new(@g.vertexNum) {false}
		@edgeTo = Array.new(@g.vertexNum)
        dfs @g,@s
	end

	def hasPathTo v
		@visited[v] == true
	end

	def pathTo v
		#special case: 
		return [@s] if v == @s
		p = []   #stack
		l = v
		while l != @s do 
			p.push(l)
			l = @edgeTo[l]	
		end  
		p.push(@s)
		p
	end

	def dfs g, v
		@visited[v] = true
		puts "#{v} visited"
		g.adj(v).each do |w|
			if (!@visited[w])
				@edgeTo[w] = v 
				dfs(g,w)
            end
		end
	end
end

g= Graph.new("data.txt")
path = DepthFirstPath.new(g,0) 
g.vetexs.each do |w|
    to = path.hasPathTo(w)
    if to == true
        puts "has path to #{w} : #{path.pathTo(w).inspect}"
    else
        puts "no path to #{w}"
    end
end





