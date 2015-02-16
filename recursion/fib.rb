
#
#
#lesson learned
#fib (n-1) + fib(n-2)  ->>> fib((n-1)+fib(n-2))
#will cause error:
#Stack level too deep (SystemStackError)
#
#recursive version
def fib n
    return 0 if n == 0
    return 1 if n == 1
    fib (n-1) + fib(n-2)
end


#iterative version
def fib_i n
    return 0 if n == 0
    return 1 if n == 1
    r = 0
    a = 1  # f(1)  
    b = 0  # f(0)
    2.upto(n) do |_i|
       r = a + b 
       b = a 
       a = r
    end
    r
end


(0..10).each do |i|
    puts "#{fib(i)} #{fib_i(i)}"
end

