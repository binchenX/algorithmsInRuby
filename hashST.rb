require_relative 'listST'
#
#implement Symbol Table using Hash
#
#use seperate chain to solve conflict
#use listST to store (k,v) in each hash slot



class HashST



	# a hash with m slot, a listST for each slot
	def initialize m 
		@m = m
		@s = Array.new(m)
		@n = 0
	end

	def put k, v
		i = hash(k)
		if (@s[i].nil?) then
			l = ListST.new
			l.put(k,v)
			@s[i] = l
			@n += 1
		else
			if(@s[i].get(k).nil?) then @n += 1 end
			@s[i].put(k,v)
		end
	end

	def get k
		i = hash(k)	
		return nil if @s[i].nil?
		@s[i].get(k)
	end

	def hash k
		(k.hash & 0x7FFFFFFF) % @m
	end

	private :hash

	def delete k
		return if get(k).nil?
		i = hash(k)
		return if @s[i].nil?
		@s[i].delete(k)
		@n -= 1
	end


	def size
		@n
	end

	def isEmpty?
		size == 0
	end

	def contains? k
		get(k) != nil
	end




end
