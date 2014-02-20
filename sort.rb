#!/usr/bin/ruby
def quick_sort a,l,h
	if ((h-l) > 0)
		p	=	partition a, l,h
		quick_sort a, l , p-1
		quick_sort a, p+1,h
	end
end


def swap a , k , i
	t = a[k]
	a[k] = a[i]
	a[i] = t
end 

def partition a , l , h
	p = h 
	k = l # the first element >= a[p]
	for i in l...h
			if a[i] < a[p]
				swap(a , k , i)
				k = k + 1 
			end
	end
	swap a , k , p
	return k
end

def swap a , k , i
	t = a[k]
	a[k] = a[i]
	a[i] = t
end 



#tests
testFail = false
r = Random.new
100.times do 
	#build a array contains 50 element
	a=[]
	50.times do a << r.rand(100) end
	b = a.dup
	quick_sort a , 0 , a.size - 1
	if a != b.sort then testFail = true end
end 
puts testFail == true ? "fail" : "OK"



