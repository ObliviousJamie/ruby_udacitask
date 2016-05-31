require_relative 'todolist.rb'
require 'date'

# Creates a new todo list
list = TodoList.new("Things to learn")

# Add four new items
list.add_item("Learn Rails")
list.add_item("Learn Ruby", importance: 10)
list.add_item("Learn new VIM commands", date: Date.new(2016,9,9))
list.add_item("Learn German", importance: 3, date: Date.today)

# Print the list
list.print_by_priority

# Delete the first item
list.remove_item(0)

# Print the list
list.print_by_priority

# Delete the second item
list.remove_item(1)

# Print the list
list.print_by_priority

# Update the completion status of the first item to complete
list.get_item(0).update_status

# Print the list
list.print_by_priority

# Update the title of the list
list.title = "Little list of things to learn"

# Print the list
list.print_by_priority

#Store in file
list.save_file
