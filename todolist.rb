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
        unless File.file?('list.json')
            save_file
        end
        @hashed_items = load_file
    end 

     #Adds an item
     def add_item(new_item, priority = {importance:1})
         item = Item.new(new_item, priority)
         @items.push item
     end
     #Removes Item
     def remove_item(index)
         @items.delete_at(index) 
     end
     #Checks if high priority item is in the list
     def has_urgent?
         puts @items.any?{|item| item.priority > 8}
     end
     #Prints items in the list
     def print_items(list = @items)
         puts "+++++#{@title} +++++ "
         list.each{|list_item| list_item.print_details}
         puts ""
     end
     #Prints list in order of priority
     def print_by_priority
         sorted = @items.sort{|item_1,item_2| item_2.priority.to_i <=> item_1.priority.to_i}
         print_items sorted
     end
     #Gets item at given index
     def get_item(index)
         @items[index]
     end
     #Saves file with JSON in list.json
     def save_file
        @stored_file = File.new("list.json", "w+")
        hashed = Hash.new("items")
        @items.each_with_index do |item, index|
            hashed["#{item.description},#{item.completed_status},#{item.priority.to_s},#{item.date_string}"] = index  
        end
        @stored_file.write(hashed.to_json)
     end
     #Loads file
     def load_file
         path = File.join(File.dirname(__FILE__), 'list.json')
         file = File.read(path)
         items_hash = JSON.parse(file) rescue {}
         index = 0
         items_hash.each do |item, task_hash|
             puts "key #{item} "
             item = item.split(",")
             insert_item = Item.new(item[0], importance:item[2], date:item[3])
             insert_item.completed_status = item[1]
             @items[index] = insert_item
             index = index + 1
         end
     end
end

class Item
    # methods and stuff go here
    attr_reader :description, :completed_status, :priority, :date
    attr_writer :completed_status

     # Initialize item with a description and marked as
     # not complete
     def initialize(item_description, options = {})
        @description = item_description
        @completed_status = false
        @priority = options[:importance].to_i || 1 
        @date_due = options[:date] || "No date set"
     end
     #Flips current status
     def update_status
         @completed_status = !@completed_status
     end
     #Prints current status
     def print_status
         puts @completed_status
     end
     #Returns date as a string
     def date_string
         @date_due.to_s
     end
     #Prints item details 
     def print_details
         puts "#{@description} Completed:#{@completed_status} Priority: #{@priority} Due Date: #{@date_due}" 
     end


end
