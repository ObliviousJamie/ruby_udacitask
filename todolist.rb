class TodoList
    # methods and stuff go here
    attr_reader :title, :items
    attr_writer :title
    # Initialize and tod list with title and no items
    def initialize(list_title)
        @title = list_title
        @items = Array.new
    end 

     #Adds an item
     def add_item(new_item, priority = 1)
         item = Item.new(new_item, priority)
         @items.push item
     end

     def remove_item(index)
         @items.delete_at(index) 
     end

     def has_urgent?
         puts @items.any?{|item| item.priority > 8}
     end

     def print_items(list = @items)
         puts "+++++#{@title} +++++ "
         list.each{|list_item| list_item.print_details}
         puts ""
     end

     def print_by_priority
         sorted = @items.sort{|item_1,item_2| item_2.priority.to_i <=> item_1.priority.to_i}
         print_items sorted
     end

     def get_item(index)
         @items[index]
     end
end

class Item
    # methods and stuff go here
    attr_reader :description, :completed_status, :priority

     # Initialize item with a description and marked as
     # not complete
     def initialize(item_description, priority = 1)
        @description = item_description
        @completed_status = false
        @priority = priority 
     end

     def update_status
         @completed_status = !@completed_status
     end

     def print_status
         puts @completed_status
     end
     
     def print_details
         puts "#{description} Completed:#{@completed_status} Priority: #{@priority} " 
     end


end
