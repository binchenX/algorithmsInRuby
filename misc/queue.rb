class Queue
    def initialize(n)
        @N = n
        @a=Array.new(@N)
        @h = 0   #next dequene index
        @t = 0   #next enqueue space
        @size = 0
    end

    def enqueue e
        return false if full?
        @a[@t] = e
        @t = (@t + 1) % @N
        @size += 1
        true
    end

    def dequeue
       return nil if empty?
       e = @a[@h] 
       @h = (@h + 1) % @N 
       @size -= 1
       e
    end

    def empty?
        @size == 0
    end

    def full?
        @size == @N
    end

    def size
        @size
    end
end

=begin
q = Queue.new(3)
(1..4).each do |i|
    r = q.enqueue(i)
    puts "#{r} #{q.size}"
end

4.times do |i|
    r = q.dequeue
    puts "#{r} #{q.size}"
end
=end
