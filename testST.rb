require_relative 'orderedArrayST'
require_relative 'bst'
require 'test/unit'

class TestBinarySearchST <  Test::Unit::TestCase
	def setup
		@h = create_st 
		@refHash = {}
		k = ['s','e','a','r','c','h','e','x','a','m','p','l','e']
		v = (0..12).to_a

		(0..12).each do |i|
			@h.put k[i],v[i]
			@refHash[k[i]] = v[i]
		end
	end

	def create_st
		 OrderedArrayST.new
#			BST.new
	end

	def test_1
		@refHash.keys.each do |key|
			assert_equal(@refHash[key],@h.get(key))
		end
		assert_equal(@refHash.keys.size,@h.size)
	end

	def test_floor
		assert_equal('a',@h.floor('a'))
		assert_equal('a',@h.floor('b'))
	end

	def test_ceiling
		assert_equal('a',@h.ceiling('a'))
		assert_equal('c',@h.ceiling('b'))
	end

	def test_delete
		n = @h.size

		assert_equal(true,@h.contains?('s'))
		@h.delete('s');
		assert_equal(false,@h.contains?('s'));assert_equal(n-1,@h.size)
		
		assert_equal(true,@h.contains?('e'))
		@h.delete('e');
		assert_equal(false,@h.contains?('e'));assert_equal(n-2,@h.size)
	end


	def test_min
		assert_equal('a',@h.min)
		assert_equal('x',@h.max)
	end


	def test_delMin
		return unless @h.respond_to?(:deleteMin)
		assert_equal('a',@h.min)
		n = @h.size
		puts "size is #{n}"
		@h.deleteMin; assert_equal('c',@h.min) ; assert_equal(n-1,@h.size)
		@h.deleteMin; assert_equal('e',@h.min) ; assert_equal(n-2,@h.size)
	end
end
