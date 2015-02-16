!#/usr/bin/env ruby
=begin

divide-conque-merge
divide the array into two halves, sort the two halves recusively, and then merge the results.

=end

class MergeSort
    
    @aux = []
    @DEBUG = 0  

    def self.sort a 
        @aux = Array.new(a.size)
        sort_2 a , 0 , a.size - 1
    end

    def self.sort_2 a , l , h
        puts "sort #{a.inspect} #{l} #{h}" if @DEBUG
        return if l >= h 
        m = l + (h - l) / 2
        sort_2 a, l, m
        sort_2 a, m + 1, h 
        merge(a,l,m,h)
    end 

    def self.merge a, l , m, h
        l.upto(h) do |i| @aux[i] = a[i] end
        puts "merge #{a[l..m].inspect} #{a[m+1..h]} (#{l} #{m} #{h}) #{@aux.inspect}" if @DEBUG
        i = l
        j = m + 1
        
        l.upto(h) do |k|
            if    (i > m)            then a[k] = @aux[j]; j += 1
            elsif (j > h)            then a[k] = @aux[i]; i += 1
            elsif (@aux[i] < @aux[j])then a[k] = @aux[i]; i += 1
            else                          a[k] = @aux[j]; j += 1
            end
        end
        puts "after merge #{a[l..h].inspect}" if @DEBUG
    end

    private_class_method :sort_2, :merge

end
