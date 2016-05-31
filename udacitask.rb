require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new("Things to learn")

# Add four new items
list.add_item("Learn Ruby", 10)
list.add_item("Learn German", 3)
list.add_item("Learn Rails")
list.add_item("Learn new VIM commands")


# Print the list
list.print_items

#list.print_by_priority

list.has_urgent?

# Delete the first item
list.remove_item(0)


# Print the list
list.print_items

# Delete the second item
list.remove_item(1)

# Print the list
list.print_items

# Update the completion status of the first item to complete
list.get_item(0).update_status


# Print the list
list.print_items

# Update the title of the list

# Print the list
