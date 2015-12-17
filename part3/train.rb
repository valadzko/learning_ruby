class Train
	attr_reader :speed, :id
	attr_accessor :wagons_number, :type

	def initialize (type, wagons_number, id)
    @type = type
		@id = id
		@wagons_number = wagons_number
		@speed = 0
  end

  def increase_speed (amount = 10)
    @speed += amount
	end

	def stop
		@speed = 0
	end

	def attache_wagon
		if @speed == 0
    	@wagons_number += 1
			puts "Wagon has been attached"
		else
			puts "Train is moving, failed to attache wagon."
		end
	end

	def detach_wagon
		if @speed == 0
			@wagons_number -= 1
			puts "Wagon has been detached"
		else
			puts "Train is moving, failed to detach wagon."
		end
	end

  def accept_route (route)
		@route = route
		@current_station = @route.first_station
	end

	def move_to_next_station
		@route.stations.each_with_index do |station, index|
			if station.name == @current_station.name
				@current_station = @route.stations[index + 1]
				puts "Train arrived to the station #{station.name}"
			end
		end
	end

  def move_to_final_destination
		loop do
			break if @current_station.name == @route.last_station.name
			move_to_next_station
		end
  end

	def prev_station
		@route.stations.each_with_index do |station, index|
			return = @route.stations[index - 1] if station.name == @current_station.name
		end
	end

	def current_station
		@current_station
  end

	def next_station
		@route.stations.each_with_index do |station, index|
			return = @route.stations[index + 1] if station.name == @current_station.name
		end
	end

end
