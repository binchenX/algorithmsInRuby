#!/usr/bin/env ruby

class Digraph

	def initialize f
		lines = File.read(f).split("\n")
		@vertexNum = lines[0].to_i
		@adj = Array.new(@vertexNum) {[]}
		edges = lines[1..-1]
		edges.each do |l|
			addEdge l.split[0].to_i, l.split[1].to_i
		end
	end

	def addEdge v ,w
		@adj[v] << w
	end

	def vertexs
		r=[]
		@adj.each_with_index do |l,i|
			r << i 
		end
		r
	end

	def adj v
		@adj[v]
	end

	def vertexNum
		@vertexNum
	end

	def reverse
		r = Digraph.new
		@adj.each_with_index do |l, i|
				l.each do |j|
					r.addEdge j, i
				end
		end
		r
	end

	def to_s
		s = ""
		@adj.each_with_index do |l,i|
			s += "#{i} -> #{l.inspect} \n"
		end
		s
	end
end


g = Digraph.new("data.txt")
puts g.inspect
# puts g.vetexs.inspect