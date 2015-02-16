=begin

Union-Find set implemenation to support Union and Find efficently for 
disjoint set.

using path compression find and rank-based union optimization

rank union:
Attach small tree to big tree ,in terms of depth of tree since that impact the 
efficience when do find and connected test.

Path compression
Attach the node to the root directly when recursively search the node's parent

=end



class UnionFindSet

    def initialize n 
        @p = Array.new(n)      #parent of element i
        @r = Array.new(n)      #number of element in tree rooted at i
        (0..n).each do |i|
            @p[i] = i            
            @r[i] = 0          
        end
    end

    def connected? a ,b 
        find(a) == find(b)
    end

    def connect a , b
        r1 = find(a)
        r2 = find(b)
        return if r1 == r2

        if (@r[a] < @r[b]) then
           @p[r1] = r2
        else 
           @p[r2] = r1
        end

        #rank increase only when previously the merge
        #tree has same rank
        if (@r[a] == @r[b] ) then @r[r1] += 1 end
        
        puts @p.inspect

    end

    alias_method :union,:connect

    #find the root element for element k 
    #use the recusive version to implement path compression easily
    def find k
        return k if @p[k] == k
        @p[k] = find(@p[k])
    end

    private :find

end


uf = UnionFindSet.new(20)
uf.connect(1,5)
uf.connect(2,5)
uf.connect(6,10)
puts uf.connected?(1,2)
puts uf.connected?(6,1)
