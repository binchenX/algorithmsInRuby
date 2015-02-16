#!/usr/bin/env ruby
#
#
#8 queen problem
#

@columnForRow = Array.new(8) {-1}


def columnForRow
    @columnForRow
end

def placeRow row
	if row == 8 then printPosition end
	for i in 0...8 do 
		columnForRow[row] = i
		if (validate(row)) then placeRow(row+1) end
    end
end

def validate row
	v = columnForRow[row]
	for i in 0...row do
		if (v == columnForRow[i] ||
    		(row - i) == (v - columnForRow[i]).abs)
            return false 
        end
	true
    end
end

@count = 0
def printPosition 
    @count += 1
    puts "--------------------------"
    columnForRow.each do |v|
    puts "%#{(v+1)}s" % 'X'
    end
end


placeRow 0
puts "#{@count} solutions"
