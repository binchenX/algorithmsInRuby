!#/usr/bin/env ruby
#
#
# for i in 0..n, select the smallest the item from (i+1)..n, 
# and swap it with item i
class SelectSort
    def self.sort a
        n = a.size - 1
        for i in 0..n
            #invariant:
            #(0..i-1) are sorted and a[i-1] < any in a[i..n]
            #after the loop:
            #(0..i) are stored and a[i] < any in a[(i+1)..n]
            #0 1  i-1 i .... n
            min = i
            for j in (i+1)..n
               min = j if(a[j] < a[min]) 
            end
            swap(a,i,min)
        end
    end

    def self.swap a , i ,j
         t = a[i]
         a[i] = a[j]
         a[j] =t 
    end
end
