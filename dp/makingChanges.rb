#making changes
#
#suppose having coins v1 ... vn, given a value j, find the mininum number of coins that 
#equals to j
#
#let C(j) denotes the min number need to exchange j
#c(j) = min { c(j-vi)} + 1 ,where vi is the value of coin
#

$coins = [1,8,10]
$MAX=0xFFFFF
def makeChanges v
    return 0 if v == 0 
    return $MAX if v < 0  #this combination is invalid work
    s=$MAX
    $coins.each do |c|
       r = makeChanges(v-c)
       s = r if r < s 
    end
    s + 1
end

puts makeChanges 20  #2
puts makeChanges 24  #3
puts makeChanges 5   #5
