require_relative 'binarySearch'

def assert c
    if (!c ) then puts "Failed" end
end


d = ['a','c','e','h','l','m','p','r','s','x']
r = binarySearch d , 'p'
assert r == 6 

r = binarySearch d , 'q'
assert r == 7 

d = ['e']
r = binarySearch d , 'a'
assert r == 0 

r = binarySearch d , 'f'
assert r == 1 

r = binarySearch d , 'e'
assert r == 0 




