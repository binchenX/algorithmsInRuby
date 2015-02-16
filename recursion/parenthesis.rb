def par n 
    par2 n, 0 ,"" 
end

# o - open parenthesis avaiable
# c - close parenthesis avaiable
def par2 o,c,s
    puts s if o == 0 && c == 0 
    if (o > 0) then par2 o - 1, c + 1, s + "(" end
    if (c > 0) then par2 o,     c - 1, s + ")" end
end

par 3
