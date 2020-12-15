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
    system("clear")
    puts "What would you like to call this task?"
    puts "Please make it short and easy to remember"
    task_name = gets.chomp.downcase
    file_name = task_name + '.txt'
    file_name.gsub!(' ', '_')
    # change into text subdirectory
    Dir.chdir("txt")
    #does file already exist?
    if File.exist?(file_name) == false
        # create new file
        File.new(file_name, "w+")
        puts "Hooray, you're ready to #{task_name} every day"
        # change back to main directory
        Dir.chdir("../")
        options
    else
        system("clear")
        puts "Sorry, there is already a task with this name"
        # change back to main directory
        Dir.chdir("../")
        options
    end
elsif input == 2
    modify_task
elsif input == 3
    visualise_task
elsif input == 4
    puts "which task would you like to delete?"
    # list files in txt folder
    # select a file
    # ask for confirmation
    # return to main menu
elsif input == 5
    puts "Goodbye"
    exit
else
    system("clear")
    puts "I didn't understand that. Please try again"
    options
end
end

options



# Method to create a new task
def new_task
    puts "What would you like to call this task?"
    puts "Please make it short and easy to remember"
    task_name = gets.chomp.gsub!(' ', '_')
    #does file already exist?
    if exist?(file_name) == false
        # create new file
        File.new('#{task_name}.txt', "w+")
        puts "Hooray, you're ready to #{task_name} every day"
        options
    else
        puts "Sorry, there is already a task with this name"
    end
end