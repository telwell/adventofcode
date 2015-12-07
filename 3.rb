def unique_stops(instructions)
	coords = [[0,0]]

	instructions.each do |el|

		last_stop = coords[-1]
		if el == "^"
			coords << [last_stop[0], last_stop[1] + 1]
		elsif el == "v"
			coords << [last_stop[0], last_stop[1] - 1]
		elsif el == ">"
			coords << [last_stop[0] + 1, last_stop[1]]
		elsif el == "<"
			coords << [last_stop[0] - 1, last_stop[1]]
		end

	end

	coords

end

File.foreach('route.txt') do |input|
	input = input.split('')

	santa_inst = input.values_at(* input.each_index.select{ |i| i.even? })

	robo_inst = input.values_at(* input.each_index.select{ |i| i.odd? })

	santa_coords = unique_stops(santa_inst)
	robo_coords = unique_stops(robo_inst)

	all_coords = santa_coords + robo_coords

	puts "#{all_coords.uniq.length}"
end