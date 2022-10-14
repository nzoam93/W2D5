require_relative "list"
require_relative "item"

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        p "\nEnter a command: "
        cmd, *args = gets.chomp.split(" ") #wow, that's smart!

        case cmd
        when "mktodo"
            @list.add_item(*args)
        when "up"
            @list.up(args[0].to_i,args[1].to_i)
        when "down"
            @list.down(args[0].to_i,args[1].to_i)
        when "swap"
            @list.swap(args[0].to_i,args[1].to_i)
        when "sort"
            @list.sort_by_date!
        when "priority"
            @list.print_priority
        when "print"
            if args.empty?
                @list.print
            else
                @list.print_full_name(args[0].to_i)
            end
        when "toggle"
            @list.toggle_item(args[0].to_i)
        when "rm"
            @list.remove_item(args[0].to_i)
        when "purge"
            @list.purge
        when "quit"
            return false
        else
            print "Sorry, that command is not recognized"
        end

        return true
    end

    def run
        until get_command == false
            self.get_command
        end
    end

end
