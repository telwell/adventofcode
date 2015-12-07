# Return a 1000 x 1000 grid of lights (off).
def init_lights
	lights = []
	1000.times do |x|
		temp = []
		1000.times do |y|
			temp << 0
		end
		lights << temp
	end
	lights
end

def affect_lights(x1, y1, x2, y2, lights, command)
	(y1..y2).each do |y|
		(x1..x2).each do |x|
			lights[x][y] = command.call(lights[x][y])
		end
	end
end

def count_on(lights)
	lights.flatten.inject(:+)
end

on = Proc.new do |el|
	el = el + 1
end

off = Proc.new do |el|
	el = (el == 0 ? 0 : el - 1)
end

toggle = Proc.new do |el|
	el = el + 2
end

lights = init_lights

File.foreach('directions.txt') do |line|
	words = line.split(' ')
	coord1 = words[1].split(',').map!{ |el| el.to_i }
	coord2 = words[3].split(',').map!{ |el| el.to_i }
	if words[0] == "toggle"
		affect_lights(coord1[0],coord1[1],coord2[0],coord2[1],lights,toggle)
	elsif words[0] == "turnon"
		affect_lights(coord1[0],coord1[1],coord2[0],coord2[1],lights,on)
	elsif words[0] == "turnoff"
		affect_lights(coord1[0],coord1[1],coord2[0],coord2[1],lights,off)
	end
end

puts count_on(lights)