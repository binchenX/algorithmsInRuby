
#
#list based Symbol Table implementation
#use sequential search
#keys are not ordered in nature order but insert order is kept
#

class ListST
	class Node
		attr_accessor :k,:v,:next
		def initialize k,v
			@k = k
			@v = v
			@next = nil 
		end
	end

	def initialize
		@head = nil
		@n = 0 
	end

	#insert new one and update if already exsist
	def put k,v
		if @head.nil? then 
			@head = Node.new(k,v)
		else 
			t = @head
			while t != nil && t.next != nil do
				if (t.k == k) then 
					t.v = v; 
					return 
				end	
				t = t.next
			end
			#t point to the tail
			t.next = Node.new(k,v)
		end
		@n += 1
	end

	def get k 
		return nil if @head.nil?
		t = @head
		while t != nil do
			if (t.k == k) then return t.v end
			t = t.next
		end
		nil
	end

	def size
		@n
	end

	def isEmpty?
		@n == 0
	end

	def contains? k
		get(k) != nil
	end

	def delete k 
		return if @head.nil?
		#l - previous node
		#k - current node under check
		l = t = @head
		if @head.k == k then @head = @head.next end
		while t != nil do
			if (t.k == k) then 
				if t == @head then @head = @head.next 
				else               l.next = t.next
				end
				@n -= 1
				return
			end
			l = t
			t = t.next
		end
	end
end 
