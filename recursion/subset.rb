

#returns a array of array
def subset s
    if s.size == 1 then return [[], s] end
    a = s[0]
    t = subset s[1..-1]
    r = []
    t.each do |e|
        r << e
        r << (e.dup << a)   #WARNING: dup!
    end
    r   
end

d = subset [1,2,3,4]
d.each do |e|
    puts e.inspect
end
