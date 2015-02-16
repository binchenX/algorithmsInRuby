#!/usr/bin/env ruby
#
class Array
#print array in binary tree
def binary_tree_print 
	h = (Math.log2 self.size).to_i + 1
	base = " " 
	(1..h).each do |l|
			t = 2**(l-1)  #number of notes in level l
			s = if l == 1 then 0 
					else 
						(1...l).inject(0) {|sum,i| sum + 2**(i-1)}
					end
			(s...(s+t)).each do |i|	
				if i < self.size
					if s == i then print base*leading(h,l) end
					print self[i]  
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

end

puts "load common"
