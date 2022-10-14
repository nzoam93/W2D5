require_relative "list"
require_relative "item"

class TodoBoard
    def initialize()
        @lists = {}
    end

    def get_command
        p "\nEnter a command: "
        cmd, *args = gets.chomp.split(" ") #wow, that's smart!

        case cmd
        when "mklist"
            @lists[args[0]] = List.new(args[0])
        when "ls"
            @lists.keys.each {|key| puts key}
        when "showall"
            @lists.each do |k,v|
                v.print
            end
        when "mktodo"
            @lists[args[0]].add_item(args[1], args[2], args[3])
        when "up"
            @lists[args[0]].up(args[1].to_i,args[2].to_i)
        when "down"
            @lists[args[0]].down(args[1].to_i,args[2].to_i)
        when "swap"
            @lists[args[0]].swap(args[1].to_i,args[2].to_i)
        when "sort"
            @lists[args[0]].sort_by_date!
        when "priority"
            @lists[args[0]].print_priority
        when "print"
            if args.length == 1
                @lists[args[0]].print
            else
                @lists[args[0]].print_full_name(args[1].to_i)
            end
        when "toggle"
            @lists[args[0]].toggle_item(args[1].to_i)
        when "rm"
            @lists[args[0]].remove_item(args[1].to_i)
        when "purge"
            @lists[args[0]].purge
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

my_board = TodoBoard.new()
my_board.run
