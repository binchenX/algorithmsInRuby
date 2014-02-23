#!/usr/bin/bin ruby
#
#


#print array in binary tree
def binary_tree_print a
	h = (Math.log2 a.size).to_i + 1

	w = 6
	space = " "
	seperator = space * w
	
#	puts "h is #{h}"
	(1..h).each do |l|
			t = 2**(l-1)  #number of notes in level l
			s = if l == 1 then 0 
					else 
						(1...l).inject(0) {|sum,i| sum + 2**(i-1)}
					end
	
#			puts "l #{l} -> s #{s} t #{t}"
			(s...(s+t)).each do |i|	
				if i < a.size 
					leading = space*((h - l)*(w/2))

					if s == i then print leading end
					print a[i] 
					print seperator
				end 
			end
			puts "\n"
			
	end 
end 

#heap 
def build_max_heap a

end 

#assume left(i), right(i) are max-heaps
def max_heapify a,i 

	s = a.size - 1

	l = left i 
	r = right i 

	# i is the leaf 
	return if l > s and r > s

	t = i 
	if l <= s and a[l] > a[i] then t = l end
	if r <= s and a[r] > a[t] then t = r end

	if t != i 
		swap a , i, t
		max_heapify a , t
	end 

end


#if i started from 1, it will be much simpler
#left = 2i
#right = 2i+1
#parent = n/2

def left i 
	2*i + 1
end 

def right i
	2*i + 2
end

#parent 0 == nil 
def parent i 
	(i-1)/2
end 



#priority queue interface
# i.e push
def insert t


end 

# i.e pop
def extract_max

end 

# i.e peek
def max a 

end 



# heap sort
#
def heap_sort a 


end




a = [3,4,6,7,12,5]

binary_tree_print a 
puts a.inspect
#max_heapify a , 1 
