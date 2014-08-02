


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

	#min key
	def min
		raise "tree is empty" if @root.nil?
		min2(@root).k	
	end

	#min node in subtree rooted at n
	def min2 n
		return n if n.left.nil?
		min2 n.left
	end

	def max
		raise "tree is empty" if @root.nil?
		max2(@root).k
	end

	def max2 n
		return n if n.right.nil?
		max2 n.right
	end

	# the one right after  k 
	def successor k
	end

	# the one right before k
	def precessor

	end


	def deleteMin
			@root = deleteMin2(@root)
	end

	# delete the min node in the subtree rooted at n
	# if the node has no left child, delete this NODE, and return its right child
	# otherwise, recusively delete its left child
	# note that only in the 2nd case, the N of each node need to be updated
	def deleteMin2 n
		if n.left.nil? then return n.right end
		n.left = deleteMin2(n.left)
		n.n =  size2(n.left) + size2(n.right) + 1
		n
	end



	# delete the node whose key is k
	def delete k
			@root = delete2 @root,k
	end

	# delete the node whose key is k from the tree rooted at x
	def delete2 x, k
		return nil if x.nil? 
		#find node to delete
		r = k <=> x.k
	
		if (r > 0) then x.right = delete2(x.right, k); updateN x; return x end
		if (r < 0) then x.left  = delete2(x.left,  k); updateN x; return x end
		
		#OK. x is node to be deleted
		#case 1: when the node to be deleted has single child - easy case, exit early
		if x.left.nil?  then return x.right end
		if x.right.nil? then return x.left end
		#case 2:when the node to be deleted has two children
		#be consistent with the description of delete algorithm in the book
		t = x
		#t is the node to be deleted
		#x is the succssor of t
		#four steps algorithm of deleting a node with two children
		x = min2(t.right)
		x.right = deleteMin2(t.right)
		x.left = t.left
		# updae the N 
		# note that deleteMin2 will update the N of all the nodes in the subtree rooted at [t.right] as necesary
		# N of the nodes in the subtree rooted at [t.left] has no need to update
		updateN x
		return x
	end

	def updateN x
			x.n = size2(x.left) + size2(x.right) + 1
	end 
	private :size2,:put2,:get2,:floor2,:ceiling2
end
