require_relative 'quickSort'
require_relative 'mergeSort'
require_relative 'selectSort'
require_relative 'insertSort'
require 'test/unit'

class TestSort <  Test::Unit::TestCase

	def testSort
		r = Random.new
		t = 1
		n = 10 
		t.times do 
			#build a array contains 50 element
			a=[]
			n.times do a << r.rand(100) end
			b = a.dup
			#hack;fix the data
			#a = [78, 71, 75, 29, 16, 1, 65, 54, 43, 9]
			#QuickSort.sort a
			#MergeSort.sort a 
			#SelectSort.sort a
			InsertSort.sort a
			#MergeSort.sort a 
			assert_equal(b.sort,a)
		end 
	end


  
  #break the right scan when j == l ,not j = l + 1
  #otherwise, following test case will fail
  #i.e:
  #while (a[j] >= p) do break if (j == l);  j -= 1 end
  #NOT
  ##while (a[j] >= p) do break if (j == l + 1);  j -= 1 end
	def _testP
		a = [1, 9, 16, 29, 43, 71, 65, 54, 75, 78]
		b = a.dup
		l = 2
		h = 3
		QuickSort.partition b, l, h
		assert_equal(b[l..h],[16,29])
	end
end
