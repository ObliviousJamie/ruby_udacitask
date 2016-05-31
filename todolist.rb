class TodoList
    # methods and stuff go here
    attr_reader :title, :items
    # Initialize and tod list with title and no items
    def initialize(list_title)
        @title = list_title
        @items = Array.new
    end
end

class Item
    # methods and stuff go here
    attr_reader :description, :completed_status

     # Initialize item with a description and marked as
     # not complete
     def initialize(item_description)
        @description = item_description
        @completed_status = false
     end
     
     #Adds an item
     def add_item(new_item)
         item = Item.new(new_item)
         @items.push(item)
     end

end
