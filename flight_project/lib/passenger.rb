class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_number)
        return @flight_numbers.include?(flight_number.upcase) #be careful with these tricks...
    end

    def add_flight(flight_number)
        if !self.has_flight?(flight_number)
            flight_number.upcase!
            @flight_numbers << flight_number
        end
    end

end
