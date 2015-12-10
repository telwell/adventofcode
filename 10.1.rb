# Setup our input (this will be used to repeat the method 
# multiple times).
input = 0

# Begin our look_say function
def look_say(line)
	# Setup the variables that we need. I wanted to use a while loop
	# here because a each loop will increase the index each time, there
	# are a couple of scenarios where I don't necessarily want to increase
	# the index.
	
	# Make our line a string and then split it up 
	# into an array.
	line = line.to_s.split('')
	
	# Holds everything after we find a number in the sequence
	# that isn't the same.
	final = []
	
	# Holding array for like numbers. Gets flushed when
	# we add things to final.
	temp = []
	
	# Stops when trigger == true
	trigger = false
	
	# Our count
	i = 0

	# Keep going until we hit the end of the line.
	while trigger == false

		# This means that we just added things to final. We 
		# want to automatically add the next item to temp 
		# and increment.
		if temp.length == 0
			temp << line[i]
			i += 1

		# Otherwise, check to see if the current item
		# matches the last item in temp. If it does then
		# add that item to temp as well and incriment.
		elsif line[i] == temp[-1]
			temp << line[i]
			i += 1

		# Otherwise that means that we DON'T have a match
		# and want to add our info to final then flush temp.
		# We don't want to incriment count here because we
		# want to recheck this element again.
		else
			final << temp.length
			final << temp[-1].to_i
			temp = []
		end

		# If our item is the last item in the line then we 
		# automatically want to add it to final and complete
		# our while loop.
		if i == line.length 
			final << temp.length
			final << temp[-1]
			trigger = true
		end
	end

	# Return the final number joined together.
	final.join('')
end

# Just some syntax to run this method with a given number
# the first time and then the returned item every other time.
50.times do |x|
	if x == 0
		input = look_say(1113122113)
	else
		input = look_say(input)
	end
end

puts input
puts input.length