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
		 #OrderedArrayST.new
			BST.new
	end

	def test_1
		@refHash.keys.each do |key|
			assert_equal(@refHash[key],@h.get(key))
		end

	end

	def test_2
		assert_equal('a',@h.floor('a'))
		assert_equal('a',@h.floor('b'))
		assert_equal('a',@h.ceiling('a'))
		assert_equal('c',@h.ceiling('b'))

		assert_equal(true,@h.contains?('s'))
		@h.delete('s')
		assert_equal(false,@h.contains?('s'))

	end
end
