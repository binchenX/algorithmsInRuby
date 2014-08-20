=begin
Binary Heap based priority queue implementation.

A binary heap is binary tree with following two additional constraints and is
reprensented in level order in an array.

Shape property
The tree is a complete binary tree; that is, all levels of the tree, except possibly the last one (deepest) 
are fully filled, and, if the last level of the tree is not complete, the nodes of that level are filled from 
left to right.

Heap property
All nodes are either [greater than or equal to] or [less than or equal to] each of its children, according to 
a comparison predicate defined for the heap.
=end


class BinaryHeapPQ
  
  def initialize 
    @c = 16               #capacity
    @a = Array.new(@c+1)  #[0] is not used 
    @n = 0
  end
  
  # put the new node at the end of the tree and swim up it
  def insert k
    @n += 1
    @a[@n] = k
    swimUp(@n)
  end 

  alias_method :push,:insert

  # replace the node at the root with the node at the end and then sink down it
  def delMax
    m = @a[1]  
    @a[1] = @a[@n]
	@a[@n] = nil           #useful for debugging , e.g acess element already deleted in sinkDown
    @n -= 1
    sinkDown(1)
    m
  end 
  alias_method :pop,:delMax
  
  # i.e peek
  def max
  	@a[1]
  end

  def size
	@n
  end

  def isEmpty?
	@n == 0 	
  end
  #internal implemetation which preceeding interfaces rely on
  
  
  #restore the Heap property by swimming up the node k, which may be greater than its parent.
  #Keeping swimming up by exchanging with its parent until it is not larger than its parent
  #used to implement insert
  def swimUp k
    while ( k > 1 && less(parent(k),k)) do
        swap(parent(k),k)
        k = parent(k)
    end
  end
  
  #restore the Heap property by sinking donw the node k ,which may be smaller than its children.
  #keep sinking down by exchange with the *larger* child until it is not smaller than its children.
  #used to implement deleteMax
  #small trick:check if you have left/right child before comparing
  def sinkDown k
    while (2*k <= @n) do
       j = left(k)
       if (j < @n && less(left(k),right(k))) then j += 1 end
       if (!less(k,j)) then break end
       swap(k,j)
       k = j;          
    end
  end

  def swap i ,j 
  	t = @a[j]
  	@a[j]= @a[i]
  	@a[i] = t
  end 

  def left i	
  	2*i
  end 

  def right i
  	2*i + 1
  end

  def parent i 
  	i/2
  end 
  
  def less i , j
    r = @a[i] <=> @a[j]
    return true if r < 0 
    false
  end
 
  def inspect
	@a.inspect + "->#{@n}"	
  end
  private :swimUp,:sinkDown,:swap,:left,:right,:parent

end



#test
pq = BinaryHeapPQ.new
[2,3,4,32,18,19,64,54,6].each {|d| pq.insert(d); puts pq.inspect}
puts pq.inspect
while (!pq.isEmpty?) do
x = pq.delMax
puts x
end
