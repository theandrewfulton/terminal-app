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
    puts "Here are your tasks"
    # change directory to the text folder
    Dir.chdir("txt")
    # list files in txt folder
    filenames = Dir.entries(".")
    filenames.delete_if {|task| task == '.'}
    filenames.delete_if {|task| task == '..'}
    filenames.each do |task|
        task.gsub!('_', ' ')
        task.gsub!('.txt', '')
    end
    puts filenames
    puts "What did you do today?"
    complete = gets.chomp
     if filenames.include?(complete) == true
         # read array saved in file
         # add array entry
         # write array back to file
         puts "Did you complete this today or a different day?"
         puts "1. Today"
         puts "2. A different day"
         input = gets.chomp.to_i
         if input == 1
            time = Time.new
            date = []
            date << time.year
            date << time.month
            date << time.day
            file_name = complete + '.txt'
            file_name.gsub!(' ', '_')
            current_data = File.read(file_name).to_a
            puts current_data.class
            if
            # current date not already entered
            current_data << date.to_s + ', '
            File.write(file_name, current_data)
            puts current_data
            else puts "Whoops, looks like you've already marked this task complete on this day"
            end
         elsif input == 2
         # if input is 2
         else  # Clear the screen
            system("clear")
            puts "Sorry, we couldn't find a task with that name"
            # change back to main directory
            Dir.chdir("../")
            options
         end
         # change back to main directory
         Dir.chdir("../")
         options
     else  # Clear the screen
         system("clear")
         puts "Sorry, we couldn't find a task with that name"
         # change back to main directory
         Dir.chdir("../")
         options
     end
elsif input == 3
    visualise_task
elsif input == 4
    puts "Here are your tasks"
    # change directory to the text folder
    Dir.chdir("txt")
    # list files in txt folder
    filenames = Dir.entries(".")
    filenames.delete_if {|task| task == '.'}
    filenames.delete_if {|task| task == '..'}
        filenames.each do |task|
        task.gsub!('_', ' ')
        task.gsub!('.txt', '')
    end
    puts filenames
    # select a file
    puts "Which task would you like to delete?"
    delete = gets.chomp
    if filenames.include?(delete) == true
         # ask for confirmation
         puts "Are you sure you want to delete #{delete}? (Y/N)"
         confirm = gets.chomp.downcase
         if confirm == 'y'
            # delete the file
            file_name = delete + '.txt'
            file_name.gsub!(' ', '_')
            File.delete(file_name)
            puts "Task deleted"
            # change back to main directory
            Dir.chdir("../")
            options
         elsif confirm == 'n'
            # Clear the screen
            system("clear")
            puts "Task not deleted"
            # change back to main directory
            Dir.chdir("../")
            options
         else # Clear the screen
            system("clear")
            puts "Sorry, I didn't understand that. Please try again"
            # change back to main directory
            Dir.chdir("../")
            options
         end
    else  # Clear the screen
        system("clear")
        puts "Sorry, we couldn't find a task with that name"
        # change back to main directory
        Dir.chdir("../")
        options
    end
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