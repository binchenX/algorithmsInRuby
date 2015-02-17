#
# in an array of numbers, find the continouse sequence whose sum is maximum
# and return the maxium sum
#
# two ways to solve this problem, depending on how you formulate the subproblem:
# 1) 
# let s[j] denotes the longest sub sequence starting at j (and end at the end)
# s[j] = max {a[j], a[j] + s[j+1]}
#
# 2) 
# let s[j] denotes the longest subsequece ending at j (and start from 0)
# s[j] = max {s[j-1]+a[j], a[j]}
#
def longestSubSequence a 
    last = a.length - 1 
    max = -0xFFFFFFFF 
    last.downto(0) do |i|
        puts "---find max start at #{i}"
        m = longestSubSequence2 a , i
        if (m > max)
            max = m
        end    
    end
    max
end

#longest sub sequence start with i 
def longestSubSequence2 a,i 
    puts "find max start at #{i}"
    if i >= a.length then raise "Index out bound" end
    if i == a.length - 1 then return a[i] end
    l = longestSubSequence2(a,i+1)
    l > 0 ? a[i] + l : a[i]
end

a = [6,2,-3,8,7,5,4]
puts longestSubSequence a 
