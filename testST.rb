require_relative 'binarySearchSymbolTable'
require 'test/unit'

#to use assert
class TestBinarySearchST <  Test::Unit::TestCase

def test_all
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

	puts h.keys.sort.inspect
	assert_equal('a',h.floor('a'))
	assert_equal('a',h.floor('b'))
	assert_equal('a',h.ceiling('a'))
	assert_equal('c',h.ceiling('b'))

	assert_equal(true,h.contains?('s'))
	h.delete('s')
	assert_equal(false,h.contains?('s'))

end
end
