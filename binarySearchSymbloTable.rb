require './binarySearch'

class BinarySearchSymbloTable


	def initialize
		@k = Array.new
		@v = Array.new
	end


	#insert for new key, keep key sorted
	#updated if key already exsit
	def put k, v
		r = rank(k)
		#debug
		puts r
		# update
		if (r < @k.size() && k == @k[r]) then @v[r] = v; return end
		#insert
		n = @k.size
		puts "------ #{n}"
		n.downto(r + 1) do |i|
				@k[i] = @k[i - 1]
				@v[i] = @v[i - 1]
		end
		@k[r] = k
		@v[r] = v

		#debug
	puts		@k.inspect
	puts		@v.inspect
	end


	#return nil if not found
	def get k
		return nil if isEmpty?()
		r = rank(k)
		if (r < @k.size() && k == @k[r]) then return @v[r] end
		return nil
	end

	def delete k

	end

	def isEmpty?
		return true if @k.empty?
		return false
	end

	def size

	end

	def rank k
		return binarySearch @k,k
	end


	def minKey

	end 


	def maxKey

	end

	def keys

	end


	def keys lo, hi

	end

end



h = BinarySearchSymbloTable.new
refHash = {}
k = ['s','e','a','r','c','h','e','x','a','m','p','l','e']
v = (0..12).to_a

(0..12).each do |i|
	h.put k[i],v[i]
	refHash[k[i]] = v[i]
end

(0..12).each do |i|
	key = k[i]
	puts "#{key} #{refHash[key]} #{h.get(key)}" # then puts "failed!" end
end
