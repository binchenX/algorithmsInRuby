#!/usr/bin/env ruby
#
#implement Symbol Table using Hash
#
#use linear probe to solve hash key conflict


class LinearProbingHashST
    def initialize c 
        @n = 0                 #number of k,v pair in the table 
        @c = c                 #capacity of the hash table; always keep the capacity 4 times of the actually size
        @k = Array.new(@c)
        @v = Array.new(@c)
    end

    #if a new key hashes to an empty slot, it is stored there;
    #otherwise, scan sequentially to find an empty slot.During the scan,
    #check if the new key already exsits and update it if it does.
    #This is called linear probing.
    def put k ,v 
        resize(2*@c) if (@n >= @c/2)
        i = hash(k)
        #comments: this is one of the rare place where c is superior to ruby.
        #following c for-loop is more compact and sustint than the while statement
        #for (i = hash(k); @k[i] != nil ; i = (i+1)%@c )
        while @k[i] != nil do
            if @k[i].eql?(k) then @v[i]=v; return end
            i = (i + 1 ) % @c 
        end
        @k[i] = k
        @v[i] = v 
        @n += 1
    end

    #scan sequentially starting at its hash index until finding nil (search miss)
    #or the key (search hit)
    def get k
        i = hash(k)
        while @k[i] != nil do
            if @k[i].eql?(k) then return @v[i] end
            i = (i + 1 ) % @c 
        end
        nil
    end

    def hash k
        (k.hash & 0x7FFFFFFF) % @c
    end

    #resize current hash table's capacity to c
    #TODO:
    def resize c

    end

    #you can simply set the target key index to nil since it will 
    #terminate the search for keys that are in the same cluster as the target key. 
    #In addition, We need to reinsert all the afterwards keys/values in same cluster 
    def delete k
        return if (!contains?(k))
        
        #find target key index and set it nil
        i = hash(k)
        while @k[i] != k do
          i = (i + 1) % @c
        end
        @k[i] = nil
        @v[i] = nil
        
        #reinsert all afterwards keys/values in the same cluster 
        i = (i +1 ) % @c
        while @k[i] != nil do
           kk = @k[i]
           vv = @v[i]
           put kk,vv
           #compensate the +1 in put
           @n -= 1
           i = (i +1 ) % @c
        end
        
        #decrease for delete
        @n -= 1
        resize(@c/2) if ( @n > 0 && @n == @c/8)
    end

      def size
          @n
      end

    def contains? k
        get(k) != nil
    end

    def isEmpty?
        @n == 0
    end
end
