require_relative 'digraph'

# detect if the graph has a cycle



class DirectedCycle

	def initialize g
		@g = g
		@marked = Array.new(g.vertexNum) { false }
		@onStack = Array.new(g.vertexNum) { false }
		@hasCycle = false
		@edgeTo = Array.new(g.vertexNum)
		g.vertexs.each do |v|
			if !@marked[v] then dfs g , v end 
		end
	end

	def dfs g, v
		puts "visit->#{v}"
		@marked[v] = true
		@onStack[v] = true
		g.adj(v).each do |w|
			return if hasCycle
			if(!@marked[w]) 
				@edgeTo[w] = v
				dfs g,w 
			elsif @onStack[w]
				puts "find cycle #{v} ->#{w}"
				@hasCycle = true
				l = v
				@cycles = []
				while (l != w) do
					@cycles.push(l)
					l = @edgeTo[l]
				end
				@cycles.push w
				@cycles.push v
			end
		end	
		@onStack[v] = false
		puts "done->#{v}"
	end

	def hasCycle
		@hasCycle
	end

	def cycles
		@cycles
	end
end


g = Digraph.new("data.txt")
cycleFinder = DirectedCycle.new(g)
if cycleFinder.hasCycle
	puts cycleFinder.cycles.inspect
end
