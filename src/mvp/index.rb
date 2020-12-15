# Clear the screen
system("clear")
# Welcome message
puts "Welcome to the Daily Task Tracker"
# Options
def options
puts "What would you like to do today?"
puts "1. Create a new task to track"
puts "2. Select an existing task to track"
puts "3. Show a task visually"
puts "4. Delete an existing task"
puts "5. Exit"
# User input
input = gets.chomp.to_i

if input == 1
    new_task
elsif input == 2
    modify_task
elsif input == 3
    visualise_task
elsif input == 4
    delete_task
elsif input == 5
    puts "goodbye"
    exit
else
    system("clear")
    puts "I didn't understand that. Please try again"
    options
end
end

options




def new_task
end