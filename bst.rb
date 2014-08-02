


#section 3.2 Algorithm

#use binary search tree to implement Symbol Table
#binary search tree:
#is a type of binary tree with the constraint that key in any node is
#larger  than all the keys of the nodes in that node's left subtree, and 
#smaller than all the keys of the nodes in that node's right subtree
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

	#if key is alreay there , update it
	#if not ,insert it
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

	#return the key if exsit, otherwise return nil
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


	def floor k
		x = floor2 @root, k
		if x.nil? then nil else x.k end
	end

	def floor2 n, k
		return nil if n.nil?
		r = k <=> n.k
		if (r ==0) then return n                end
		if (r < 0) then return floor2 n.left, k end
		t = floor2(n.right,k)
		if not t.nil? then t else n end
	end


	def ceiling k
		x = ceiling2 @root,k
		if x.nil? then nil else x.k end
	end


	def ceiling2 n, k
		return nil if n.nil? 
	  r = k <=> n.k
		if (r == 0 ) then return n end
		if (r > 0  ) then return ceiling2(n.right, k) end
		t = ceiling2(n.left,k)
		if not t.nil? then t else n end
	end

	def contains? k
		if get(k).nil? then false else true end
	end


	def delete k

	end
	private :size2,:put2,:get2,:floor2,:ceiling2
end
