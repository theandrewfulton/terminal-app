require 'date'

# Menu method
def menu
    # Welcome message
    puts "Welcome to the Daily Task Tracker"
    puts "What would you like to do today?"
    puts "1. Create a new task to track"
    puts "2. Select an existing task to track"
    puts "3. Show a task visually"
    puts "4. Delete an existing task"
    puts "5. Exit"
    # User input
    input = gets.chomp
    case input.to_i
    when 1
        new_task
        menu
    when 2
        existing_tasks
        menu
    when 3
        visualise_task
    when 4
        delete_task
        menu
    when 5
        puts "Goodbye"
        exit
    else
        system("clear")
        puts "I didn't understand that. Please try again"
        menu
    end
end

# new task method
def new_task
    system("clear")
    puts "What would you like to call this task?"
    puts "Please make it short and easy to remember"
    task_name = gets.chomp.downcase
    file_name = task_name + '.txt'
    file_name.gsub!(' ', '_')
    # change into text subdirectory
    Dir.chdir('txt') do
        #does file already exist?
        if File.exist?(file_name) == false
            # create new file
            File.new(file_name, "w+")
            puts "Hooray, you're ready to #{task_name} every day"
        elseDate.iso8601(gets)
            puts "Sorry, there is already a task with this name"
        end
    end
end

# existing tasks method
def existing_tasks
    puts "Here are your tasks"
    # change directory to the text folder
    Dir.chdir("txt") do
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
            puts "Did you complete this today or a different day?"
            puts "1. Today"
            puts "2. A different day"
            input = gets.chomp.to_i
            if input == 1
                date = Date.today.to_s
                file_name = complete + '.txt'
                file_name.gsub!(' ', '_')
                current_data = File.read(file_name)
                # this is currently a string, need to work on staring as an array
                if
                    current_data.include?(date) == false
                    current_data << date + ','
                    File.write(file_name, current_data)
                    puts current_data
                else puts "Whoops, looks like you've already marked this task complete on this day"
                end
            elsif input == 2
                puts "Please add the date you completed the task in the format YYYY-MM-DD"
               date = Date.iso8601(gets)
                #    Opportunity for error handling!
                if date > Date.today
                    puts "Hey there time traveller! It looks like this is in the future"
                    puts "Please try again"
                else 
                    file_name = complete + '.txt'
                    file_name.gsub!(' ', '_')
                    current_data = File.read(file_name)
                    # this is currently a string, need to work on staring as an array
                    if current_data.include?(date.to_s) == false
                        current_data << date.to_s + ', '
                        File.write(file_name, current_data)
                        else puts "Whoops, looks like you've already marked this task complete on this day"
                    end
                end
            else  # Clear the screen
                system("clear")
                puts "Sorry, we couldn't find a task with that name"
            end
        else  # Clear the screen
            system("clear")
            puts "Sorry, we couldn't find a task with that name"
        end
    end
end

# delete tasks method
def delete_task
    puts "Here are your tasks"
    # change directory to the text folder
    Dir.chdir("txt") do
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
                # Clear the screen
            elsif
                system("clear")
                puts "Task not deleted"
            else # Clear the screen
                system("clear")
                puts "Sorry, I didn't understand that. Please try again"
            end
        else  # Clear the screen
            system("clear")
            puts "Sorry, we couldn't find a task with that name"
        end
    end
end

# Clear the screen
system("clear")
menu
