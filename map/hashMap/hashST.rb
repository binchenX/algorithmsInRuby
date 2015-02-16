require_relative '../naive/listST'
#
#implement Symbol Table using Hash
#
#use listST to store (k,v) in each hash slot
#use seperate chain to solve conflict

class HashST
    # a hash with m slot, a listST for each slot
    def initialize m 
        @m = m
        @s = Array.new(m) {ListST.new}
    end

    def put k, v
        i = hash(k)
        @s[i].put(k,v)
    end

    def get k
        @s[hash(k)].get(k)
    end

    def hash k
        (k.hash & 0x7FFFFFFF) % @m
    end
    private :hash

    def delete k
        i = hash(k)
        @s[i].delete(k)
    end

    #slow but get a clean put/get implementation
    def size
        @s.inject(0) {|s,m| s += m.size()}  
    end

    def isEmpty?
        size == 0
    end

    def contains? k
        get(k) != nil
    end
end
