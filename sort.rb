#!/usr/bin/ruby
#
def quick_sort a,l,h
#	puts "qs #{l} #{h}"
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
#	puts "part #{l} #{h}"
	p = h 
	k = l # the first element >= a[p]
	for i in l...h
#		  puts "-> #{a[p]} #{a[i]}"
			if a[i] < a[p]
				swap(a , k , i)
				k = k + 1 
			end
	end
	swap a , k , p
	return k
end

a = [10,4,5,6,7,2,23,45]
puts a.inspect 
quick_sort a , 0 , a.size - 1
puts a.inspect



