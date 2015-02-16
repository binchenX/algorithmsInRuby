#!/usr/bin/ruby
=begin
Quicksort is a divide-and-conquer method for sorting. It works
by partitioning an array into subarrays, then sort the subarrays independently.

The the key to this algorithm is partition(a,l,h) method, which return index p,
swap the elements in place and ensure following conditions meets:  
        a[i] < a[p] | i in (l..p) 
        a[i] > a[p] | i in (p+1..h) 

In this sense, we can call quickSort , pivot based partition sort.

It is worth to note the difference to MergerSort, which divide the array to equal lenght
sub-arrayies , sort and then merger them.
=end

class QuickSort

    def self.sort a 
        sort_2 a, 0, a.size - 1
    end

    def self.sort_2 a,l,h
        return if h <= l 
        p = partition a, l, h
        sort_2 a, l ,   p - 1
        sort_2 a, p + 1,h
    end

    #pick the first as the pivot
    #scan left to find the element that is not less than the pivot, assume it stops at i 
    #scan right to find the element that is not larger than the pivot, assume it stop at j
    #exchange the element at i and j
    #check for the scan complete
    #  
    #    ----------->           <------
    #  l (l+1) . . . i . .  . . j . ..  h
    #  p        < p              >=p
    #
    def self.partition a, l, h
        p = a[l]  #pick the first as pivot 
        i = l + 1
        j = h
        while (true) do
            while (a[i] < p)  do break if (i == h);  i += 1 end
            while (a[j] >= p) do break if (j == l);  j -= 1 end   # not break if (j == l + 1), see testSort.testP
            break if (i >= j)
            swap(a,i,j)
        end
        swap a, j, l
        return j 
    end

    def self.swap a, k, i
        t = a[k]
        a[k] = a[i]
        a[i] = t
    end 

end
