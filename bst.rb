


#section 3.2 Algorithm

#use binary search tree to implement Symbol Table

class BST

	
	class Node
		attr_accessor :k,:v,:n,:left,:right

		def initialize k,v,n
			@k = k
			@v = v
			@n = n
			@left = nil
			@right = nil
		end
	end

	def initialize
		@root = nil
	end

	def put k ,v
		@root = put2(@root,k,v)
	end

	def put2 node, k, v
		if node.nil? then return Node.new(k,v,1) end
		r = (k <=> node.k)
		if (r > 0)    then node.right = put2(node.right,k,v)
		elsif (r < 0) then node.left  = put2(node.left, k,v)
		else node.v = v
		end
		node.n = size2(node.left) + size2(node.right) + 1 
		node

	end

	def get k
		get2(@root,k)
	end

	def get2 n,k
		return nil if n.nil?
		r = (k <=> n.k)
		if r > 0  then return get2(n.right,k)
		elsif r < 0 then return get2(n.left,k)
		else n.v
		end
	end

	def size
		size2 @root
	end

	def size2 node
		if node.nil? then 0 else node.n end
	end




	private :size2,:put2,:get2
end
