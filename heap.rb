#!/usr/bin/bin ruby
#
#


#print array in binary tree
def binary_tree_print a
	h = (Math.log2 a.size).to_i + 1
	base = " " 
	(1..h).each do |l|
			t = 2**(l-1)  #number of notes in level l
			s = if l == 1 then 0 
					else 
						(1...l).inject(0) {|sum,i| sum + 2**(i-1)}
					end
			(s...(s+t)).each do |i|	
				if i < a.size
					if s == i then print base*leading(h,l) end
					print a[i]  
					print base*item_space(h,l) 
				end 
			end
			puts "\n"
	end 
	puts "-----------------------------"
end 


#the leading of level l of total h
def leading h, l
	if h == l then return 0 end
	leading(h, l + 1) + item_space(h, l + 1) /2  
end

#the item space in level l
def item_space h , l
	base = 4 
	base * 2** (h - l) 
end 

#heap 
def build_max_heap a
	l = a.size
	(l/2).downto(0).each do |i|
			max_heapify(a,i)
	end 
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


def swap a , i ,j 
	t = a[j]
	a[j]= a[i]
	a[i] = t
	
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
def insert a, k
	a << -1
	increaseKey a, a.size-1,k
end 


def increaseKey a, i, key
	return if a[i] >= key
	a[i] = key
	puts "increase #{i} to #{key}"
	#bubble up i until a[i] less then his parent
	while (i > 0 && a[parent(i)] < a[i]) do
		swap a, parent(i), i
		puts "swap #{i} #{parent(i)}"
		i = parent(i)
	end

end 


# i.e pop
def extract_max
	max = a[0]
	#no need to pop actually, we need only record that the heap size decrease on
	a[0] = a.pop #pop last item
	heap_size = heap_size - 1
	max_heapify a, a[0]
	max
end 

# i.e peek
def max a 
	a[0]
end 



# heap sort
#
def heap_sort a 


end


=begin
a = [3,4,6,7,12,5]
binary_tree_print a 
max_heapify a , 1 
puts "after heapify"
binary_tree_print a 
=end

a = [3,4,6,7,12,5]
binary_tree_print a 
build_max_heap a 
puts "after build max heap"
binary_tree_print a 
puts max a 
increaseKey a, (a.size-1) ,14
binary_tree_print a 
insert a,20
binary_tree_print a 
insert a,13
binary_tree_print a 

=begin
3.downto(1) do |i|
puts "space #{item_space 3 ,i} leading #{leading 3,i}"
end

b=[]
10.times{|i| b << Random.new.rand(9)}
binary_tree_print b
=end
