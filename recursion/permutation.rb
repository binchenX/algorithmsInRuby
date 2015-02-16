

def permute s
    return [""] if s.empty?
    l = s[0]
    r = s[1..-1]
    t = permute r
    c = []
    t.each do |e|
        cc = getMix e, l
        cc.each do |e|
            c << e
        end
    end
    c 
end


#insert l to all possible position of s
def getMix s, l
   r = []
   (0..s.size).each do |i|
       r << s.dup.insert(i, l)
   end
   r
end


r = permute "abcd"
puts r.size
r.each do |s|
    puts s
end
