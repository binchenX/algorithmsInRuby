require './binarySearch'

#section 3.1 of Algorithm 
#
#
# use ordered array to store keys
# and use another array for values
# use BinarySearch to search

class OrderedArrayST

	def initialize
		@k = Array.new
		@v = Array.new
		@debug = false
		@n = 0
	end

	#insert for new key, keep key sorted
	#updated if key already exsit
	#
	#nil key not allowd
	def put k, v
		r = rank(k)
		#debug
		puts r if @debug
		# update
		if (r < @n && k == @k[r]) then @v[r] = v; return end
		#insert
		n = @n 
		n.downto(r + 1) do |i|
				@k[i] = @k[i - 1]
				@v[i] = @v[i - 1]
		end
		@k[r] = k
		@v[r] = v
		@n += 1 
		#debug
		puts		@k.inspect if @debug
		puts		@v.inspect if @debug
	end

	#return nil if not found
	def get k
		return nil if isEmpty?()
		r = rank(k)
		if (r < @n && k == @k[r]) then return @v[r] end
		return nil
	end

	def contains? k
			#sequential search
			@k.include?(k)
	end

	def delete k
			return if !contains?(k)
			p = rank(k)
			n = @n 
			#left shift from [p+1,n-1]
			(p+1).upto(n-1) do |i|
					@k[i-1] = @k[i]
					@v[i-1] = @v[i]
			end
			@n = @n - 1
	end

	def isEmpty?
		return true if @k.empty?
		return false
	end

	def size
		return @n 
	end

	def rank k
		return binarySearch @k,k
	end

	def min
		@k[0]
	end 

	def max
		@k.last
	end

	def keys
		@k
	end

	# smallest key that is >= K
	def ceiling k
		 r = rank(k)
		 @k[r]
	end

	# biggest key that is <= k
	def floor k
		r = rank(k)
		if @k[r].eql?(k) then return k end
		@k[r-1]
	end

	private :rank
end
