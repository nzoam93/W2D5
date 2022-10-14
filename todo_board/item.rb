class Item
    attr_accessor :title, :deadline, :description
    attr_reader :done
    def self.valid_date?(date_string)
        date_arr = date_string.split("-")
        if date_arr[0].length != 4
            return false
        end
        possible_months = (1..12).to_a
        if !possible_months.include?(date_arr[1].to_i)
            return false
        end
        possible_days = (1..31).to_a
        if !possible_days.include?(date_arr[2].to_i)
            return false
        end
        return true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        if !Item.valid_date?(@deadline)
            raise "CHOOSE VALID DATE"
        end
        @done = false #not done by default
    end

    def toggle
        if @done == false
            @done = true
        else
            @done = false
        end
    end
end
