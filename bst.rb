=begin
Binary Search Tree (BST) implementaion in Ruby

Definition: BST is a binary tree where each node has a comparable key 
and an associated value, with the constraint that key in any node is
larger  than all the keys of the nodes in that node's left subtree, and 
smaller than all the keys of the nodes in that node's right subtree

BST can be used to implement a sorted Symbol Table(i.e dictionary ) or Set

Reference:
Algorithm 4th, Robert Sedgecik
3.2 Binary Search Tree (BST)

copyright pierr.chen AT gmail.com
=end

class BST
	class Node
		attr_accessor :k,:v,:n,:left,:right
		def initialize k,v,n
			@k = k
			@v = v
			@n = n              # number of nodes in this subtree rooted on this node
			@left = nil
			@right = nil
		end
	end

	def initialize
		@root = nil
	end

	#---------------------------------------
	#basic  methods: put/get/delete 
	#helper methods: size/contains/isEmpty
	#iterators     : keys
	#----------------------------------------

	#insert a new (key,value),
	#if key is alreay there , update the value with the new one 
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

	#return the value associated with the key, return nil if key is not 
	#constained in the tree
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
	
	# delete the node whose key is k
	def delete k
		@root = delete2 @root,k
	end

	# delete the node whose key is k from the tree rooted at x
	def delete2 x, k
		return nil if x.nil? 
		#find node to delete
		r = k <=> x.k
		if (r > 0)    then x.right = delete2(x.right, k)
		elsif (r < 0) then x.left  = delete2(x.left,  k)
		else #x is node to be deleted
			#case 1: when the node to be deleted has single child - easy case, exit early
			if x.left.nil?  then return x.right end
			if x.right.nil? then return x.left end
			#case 2:when the node to be deleted has two children
			#just to be consistent with the description of delete algorithm in the book
			t = x
			#t is the node to be deleted
			#x is the succssor of t
			#four steps algorithm of deleting a node with two children
			x = min2(t.right)
			x.right = deleteMin2(t.right)
			x.left = t.left
		end
		updateN x
		x
	end

	def updateN x
		x.n = size2(x.left) + size2(x.right) + 1
	end 

	def contains? k
		if get(k).nil? then false else true end
	end

	# number of (key,values) pairs in the BST
	def size
		size2 @root
	end

	def size2 node
		if node.nil? then 0 else node.n end
	end
	
	def isEmpty?
			size == 0 
	end

	#return the keys in sorted order (NOT in insert order) 
	def keys
			keys2 @root
	end

	def keys2 x
		return [] if x.nil?
		keys2(x.left) + [x.k] + keys2(x.right)
	end

	#---------------------------------------
	#ordered methods: min/max, floor/ceiling, select/rank, deleteMin/deleteMaxi, keysInRange
	#----------------------------------------
	
	#return the smallest key in the BST
	def min
		raise "tree is empty" if @root.nil?
		min2(@root).k	
	end

	#min node in subtree rooted at n
	def min2 n
		return n if n.left.nil?
		min2 n.left
	end

	#return the largest key in the BST
	def max
		raise "tree is empty" if @root.nil?
		max2(@root).k
	end

	def max2 n
		return n if n.right.nil?
		max2 n.right
	end

	#return the largest key that is <= k
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

	#return the smallest key that is >= k
	def ceiling k
		x = ceiling2 @root,k
		if x.nil? then nil else x.k end
	end

	def ceiling2 n, k
		return nil if n.nil? 
	  r = k <=> n.k
		if    (r == 0 ) then n 
		elsif (r > 0  ) then ceiling2(n.right, k) 
		else  
					t = ceiling2(n.left,k)
					if not t.nil? then t else n end
		end
	end

	#find a key with the given rank 
	def select rank
		return nil if rank >= size or rank < 0
		select2(@root,rank).k
	end
	
	def select2 x, k
		t = size2(x.left)
		r = k <=> t
		if    (r == 0 )  then x
		elsif (r < 0  )  then select2(x.left,k) 
		else                  select2(x.right, k - t - 1)
		end
	end

	#find the number of keys that is less than k
	def rank k
		rank2(@root,k)
	end
	
	def rank2 x, k
		return 0 if x.nil?
		r = k <=> x.k
		if    r == 0  then size2(x.left)
		elsif r < 0   then rank2(x.left,k)
		else               size2(x.left) + 1 + rank2(x.right,k)
		end 
	end
	
	#delete the node with smallest key
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

	# keys in [lo,hi] in sorted order
	def keysInRange lo, hi
			keysInRange2 @root, (lo..hi)	
	end

	def keysInRange2 x, r
		return [] if x.nil?
		if r.include?(x.k)  then keysInRange2(x.left, r) + [x.k] + keysInRange2(x.right,r)
		elsif x.k < r.first then keysInRange2(x.right,r)
		elsif x.k > r.last  then keysInRange2(x.left, r)
		end
	end
	
	private :size2,:put2,:get2,:floor2,:ceiling2,:delete2,:rank2,:select2,:updateN
end
