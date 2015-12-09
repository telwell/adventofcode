locations = [1,2,3,4,5,6,7,8]
all_perms = locations.permutation.to_a

distances = [[nil],[],[],[],[],[],[],[],[]]

# From puzzle input
distances[1][2] = 34
distances[1][3] = 100
distances[1][4] = 63
distances[1][5] = 108
distances[1][6] = 111
distances[1][7] = 89
distances[1][8] = 132
distances[2][1] = 34
distances[2][3] = 4
distances[2][4] = 79
distances[2][5] = 44
distances[2][6] = 147
distances[2][7] = 133
distances[2][8] = 74
distances[3][1] = 100
distances[3][2] = 4
distances[3][4] = 105
distances[3][5] = 95
distances[3][6] = 48
distances[3][7] = 88
distances[3][8] = 7
distances[4][1] = 63
distances[4][2] = 79
distances[4][3] = 105
distances[4][5] = 68
distances[4][6] = 134
distances[4][7] = 107
distances[4][8] = 40
distances[5][1] = 108
distances[5][2] = 44
distances[5][3] = 95
distances[5][4] = 68
distances[5][6] = 11
distances[5][7] = 66
distances[5][8] = 144
distances[6][1] = 111
distances[6][2] = 147
distances[6][3] = 48
distances[6][4] = 134
distances[6][5] = 11
distances[6][7] = 115
distances[6][8] = 135
distances[7][1] = 89
distances[7][2] = 133
distances[7][3] = 88
distances[7][4] = 107
distances[7][5] = 66
distances[7][6] = 115
distances[7][8] = 127
distances[8][1] = 132
distances[8][2] = 74
distances[8][3] = 7
distances[8][4] = 40
distances[8][5] = 144
distances[8][6] = 135
distances[8][7] = 127

# Done setting vars

minimum = 0
all_perms.each do |perm|
	temp = 0
	(1..7).each do |x|
		temp += distances[perm[x-1]][perm[x]]
	end
	if minimum == 0 || temp < minimum
		minimum = temp
	end
end

puts minimum