require_relative "./item"

class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        new_item = Item.new(title,deadline,description)
        if Item.valid_date?(deadline) #class method so Item. , not new_item.
            @items << new_item
            return true
        end
        return false
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0
        return index < @items.size #this is why we declared size earlier
    end

    def swap(index_1, index_2)
        return false if !self.valid_index?(index_1)
        return false if !self.valid_index?(index_2)
        @items[index_1],@items[index_2] = @items[index_2],@items[index_1]
        return true
    end

    def [](index) #apparently, this needs to be specified in order to make it so that users cannot have access to the items list directly
        return nil if !self.valid_index?(index)
        return @items[index]
    end

    def priority
        return @items.[](0)
    end

    def print
        puts "".ljust(60,"-")
        puts "            #{self.label.upcase}                 "
        puts "".ljust(60,"-")
        puts "Index  | Item             | Deadline |          |Done "
        puts "".ljust(60,"-")
        @items.each_with_index do |item, index|
            puts "#{index}".ljust(7) + "| #{item.title}".ljust(18) + " | #{item.deadline}".ljust(15) + " | #{item.done}".ljust(7)
        end
        puts "".ljust(60,"-")
    end

    def print_full_name(index)
        return false if !self.valid_index?(index)
        puts "".ljust(60,"-")
        puts "#{@items[index].title}  " + "#{@items[index].deadline}" + " | #{@items[index].done}".ljust(7)
        puts @items[index].description
        puts "".ljust(60,"-")
    end

    def print_priority
        print_full_name(0)
    end

    def up(index, amount=1)
        return false if !self.valid_index?(index)
        amount.times do
            return true if index == 0 #already at the top
            swap(index, index - 1)
            index -= 1 #this makes it actually change from each iteration

        end
        return true
    end

    def down(index, amount=1)
        return false if !self.valid_index?(index)
        amount.times do
            return true if index == @items.length - 1 #already at the bottom
            swap(index, index + 1)
            index += 1 #this makes it actually change from each iteration
        end
        return true
    end

    def sort_by_date!
        @items.sort_by!{|item| item.deadline}
    end
    #be careful about when to use self and when to use @items.
    #you are sorting the @items array which has a defined Array.sort_by method

    #added for phase2
    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        @items.delete_at(index)
    end

    def purge
        new_arr = []
        @items.each do |item|
            if !item.done
                new_arr << item
            end
        end
        @items = new_arr
    end








end
