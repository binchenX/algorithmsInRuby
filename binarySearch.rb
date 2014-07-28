
#assume d is increamental sorted
#return the index if found, otherwise return the number of
#elements which are smaller than t
def binarySearch d , t
	lo = 0
	hi = d.size() -1

	while (lo <= hi) do
		mid = lo + (hi - lo) / 2
#		puts "lo #{lo} #{hi} #{mid}"
		mid = lo + (hi - lo) / 2
		if    (t > d[mid]) then lo = mid + 1 
		elsif (t < d[mid]) then hi = mid - 1 
		else  return mid
		end
	end 
	return lo 
end

def assert c
	if (!c ) then puts "Failed" end
end


d = ['a','c','e','h','l','m','p','r','s','x']
r = binarySearch d , 'p'
assert r == 6 

r = binarySearch d , 'q'
assert r == 7 

d = ['e']
r = binarySearch d , 'a'
assert r == 0 

r = binarySearch d , 'f'
assert r == 1 

r = binarySearch d , 'e'
assert r == 0 




