require 'json'
require 'date'
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
     def add_item(new_item, priority = {importance:1})
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

     def save_file
        @stored_file = File.new("list.txt", "w+")
        hashed = Hash.new
        @items.each do |item|
            hashed[@items.index(item)] = "{#{item.description},#{item.completed_status},#{item.priority.to_s},#{item.date_string}}"
        end
        @stored_file.write(hashed.to_s)
     end

     def load_file

     end
end

class Item
    # methods and stuff go here
    attr_reader :description, :completed_status, :priority, :date

     # Initialize item with a description and marked as
     # not complete
     def initialize(item_description, options = {})
        @description = item_description
        @completed_status = false
        @priority = options[:importance].to_i || 1 
        @date_due = options[:date] || "No date set"
     end

     def update_status
         @completed_status = !@completed_status
     end

     def print_status
         puts @completed_status
     end

     def date_string
         @date_due.to_s
     end
     
     def print_details
         puts "#{@description} Completed:#{@completed_status} Priority: #{@priority} Due Date: #{@date_due}" 
     end


end
