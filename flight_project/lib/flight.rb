require_relative "passenger"

class Flight
    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        return @passengers.length >= @capacity
    end

    def board_passenger(passenger_instance)
        if !self.full?
            if passenger_instance.has_flight?(@flight_number) #this @flight_number refers to the one up top in the Flight class!
                @passengers << passenger_instance
            end
        end
    end

    def list_passengers
        passenger_name = []
        @passengers.each {|passenger| passenger_name << passenger.name}
        return passenger_name
    end

    def [](index)
        return @passengers[index]
    end

    def <<(passenger_instance)
        board_passenger(passenger_instance)
    end



end
