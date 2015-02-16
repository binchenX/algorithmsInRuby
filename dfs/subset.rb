#
# print all the subsets of [1,2,3]
#
#
#
#
#
class Subset

    def initialize s
        @s = s 
        @n = @s.size
    end

    def solve
        r = []   #result subsets
        t = []   #sebset value in current node - not complete until the leaf node
        subset2(r,t,0)
        r
    end

    # i - level 
    # t - the initial value associate with this node
    def subset2 r, t, i
        if (i == @n ) then r << t; return end
        #left
        t1 = t.dup
        subset2(r, t1,i+1)
        #right
        t2 = t.dup
        t2 << @s[i]
        subset2(r,t2,i+1)
    end
end

puts Subset.new([1,2,3]).solve.inspect
