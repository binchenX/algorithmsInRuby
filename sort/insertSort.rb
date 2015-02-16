!#/usr/bin/env ruby
#
#insert sort is what happens when we trying to sort cards in real life.
#
#start from the left to the end, *insert* current card into the right place to make sure
#all the cards for leftmost to current one are in sorted order. You won't care about the cards beyond
#the current card under check.
#
#However, for selection sort, we need to *select* out the smallest item from current to the right most
#and swap it with the current one to make sure all the items from leftmost to current are sorted AND not 
#bigger than any items beyond the current.
#
#
#trick part in algorithm
#i start from 1
#j down to 1 not 0
#trick part in Ruby
#for i in 5..1 don't work as assumed
#
class InsertSort
    def self.sort a
        n = a.size - 1
        1.upto(n) do |i|    
            puts "#{a[0..i-1]} #{a[i..n]} #{i}->#{a[i]}"
            #insert a[i] to correct position b/w a[0..i-1] by keep swapping adjecent item
            #until the later is bigger than the former one 
            i.downto(1) do |j|
                break if a[j] > a[j-1]
                swap(a, j, j-1)
            end
        end
    end

    def self.swap a ,i ,j
        t = a[i]
        a[i] = a[j]
        a[j] = t
    end
end
