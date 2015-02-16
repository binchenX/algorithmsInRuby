#!/usr/bin/env ruby
require 'thread'
require_relative 'digraph'

#
#record variouse vetext visit order during dfs traversal
#

class DepthFirstOrder

	def initialize g 
		@marked = Array.new(g.vertexNum) { false }
		@preoder = 	[]   #use it as queue (shift)
		@postOrder = []
		@reverse_postOrder = []  #Stack (pop)
		g.vertexs.each do |v|
			if (!@marked[v]) then dfs g, v end
		end
	end

	def dfs g ,v 
		@preoder << v
		@marked[v] = true

		g.adj(v).each do |w|
			if(!@marked[w]) then dfs g, w end 
		end

		@postOrder << v
		@reverse_postOrder << v
	end

	def preoder
		@preoder
	end

	def post_order
		@postOrder
	end

	def reverse_postorder
		@reverse_postOrder
	end
end


g = Digraph.new("data.txt")
orders = DepthFirstOrder.new(g)
puts orders.preoder.inspect
puts orders.post_order.inspect
puts orders.reverse_postorder.reverse.inspect