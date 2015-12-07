def letter_one_apt(line)
	line = line.split('')

	line.each_with_index do |el, i|
		if i >= line.length - 2
			return false
		end

		if el == line[i+2]
			return true
		end
	end
end

def double_letter_2(line)
	line = line.split('')

	line.each_with_index do |el, i|

		if i >= line.length - 2
			return false
		end

		j = i+2
		while j != line.length - 1
			if el == line[j] && line[i+1] == line[j+1]
				return true
			end
			j += 1
		end
	end
	false
end

# def three_vowels(line)
# 	line = line.split('')
# 	line.reject!{ |x| !['a','e','i','o','u'].include?(x) }
# 	line.length >= 3 ? true : false
# end

# def double_letter(line)
# 	line = line.split('')
# 	line.each_with_index do |el, i|
# 		if i == line.length - 1
# 			return false
# 		end
# 		if el == line[i+1]
# 			return true
# 		end
# 	end
# end

# def bad(line)
# 	line = line.split('')
# 	line.each_with_index do |el, i|
# 		if i == line.length - 1
# 			return false
# 		end
# 		if ["ab","cd","pq","xy"].include?("#{el}#{line[i+1]}")
# 			return true
# 		end
# 	end
# end

i = 0
count = 0

File.foreach('list.txt') do |line|

	if letter_one_apt(line)
		if double_letter_2(line)
			count += 1
			puts "Good! #{line}"
		end
	end

	i += 1
end

puts count