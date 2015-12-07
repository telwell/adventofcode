total_size = 0

# For the wrapping paper:
# 
# File.foreach('sizes.txt').with_index do |line, line_num|
# 	line = line.split('x')
# 	line.map!{ |x| x.to_i }
# 	temp = [2*(line[0]*line[1]), 2*(line[0]*line[2]), 2*(line[1]*line[2])].sort!{ |a,b| a - b }
# 	size = (temp[0]/2 + temp[0]) + temp[1] + temp[2]
# 	total_size += size
# end

# For the bows:
# 
File.foreach('sizes.txt').with_index do |line, line_num|
	line = line.split('x')
	line.map!{ |x| x.to_i }.sort!
	ribbon = (2*line[0] + 2*line[1]) + (line[0]*line[1]*line[2])
	total_size += ribbon
end

puts total_size