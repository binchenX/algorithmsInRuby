def permute s
    puts "purmute #{s}"
	return [] if s.empty?
	p = []
	s.split("").each_with_index do |c,i|
		p2 = permute(remove(s,i))
		p2.each do |t|
			p << c + t 
		end
	end
    p
end

def remove s , i
    a = s.split("")
    a.delete_at(i)
    a.join("")
end


puts permute("ab").inspect
