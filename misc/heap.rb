#!/usr/bin/env ruby

require './common.rb'






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

def left i  
    2*i + 1
end 

def right i
    2*i + 2
end

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
    #bubble up i until a[i] less then his parent
    while (i > 0 && a[parent(i)] < a[i]) do
        swap a, parent(i), i
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



#TEST
a = [3,4,6,7,12,5]
a.binary_tree_print  
build_max_heap a 
puts "after build max heap"
a.binary_tree_print
puts max a 
increaseKey a, (a.size-1) ,14
a.binary_tree_print 
insert a,20
a.binary_tree_print  
insert a,13
a.binary_tree_print  

a = [3,4,6,7,12,5]
heap_sort a
a.binary_tree_print

