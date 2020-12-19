def menu_prompt
    # create welcome menu variable
    @prompt = TTY::Prompt.new
    # Welcome message
    welcome_art = Artii::Base.new
    title = Pastel.new
    puts title.on_blue(welcome_art.asciify ('Daily Tasks'))
    puts "Welcome to the Daily Task Tracker"
    input = @prompt.select("\n What would you like to do?\n") do |menu|
        menu.choice "Create a new task to track", 1
        menu.choice "Select an existing task to track", 2
        menu.choice "Show a task visually", 3
        menu.choice "Delete an existing task", 4
        menu.choice "Exit", 5
    end
    # menu input
    case input
        when 1
            new_task
            menu_prompt
        when 2
            existing_tasks
            menu_prompt
        when 3
            visualise_task
            menu_prompt
        when 4
            delete_task
            menu_prompt
        when 5
            message_text("\nGoodbye\n")
            exit
        # else
        #     system("clear")
        #     puts "I didn't understand that. Please try again"
        #     # menu
    end
end

# new task method
def new_task
    system("clear")
    @prompt = TTY::Prompt.new
    puts "What would you like to call this task?"
    @input = @prompt.ask("Please make it short and easy to remember",) do |q|
        q.required true
        q.modify :down, :chomp, :trim
        # I can't get validate to work
        # need to validate out everything that's no leters and numbers
        # puts "Sorry, the name can't include a '.'"
        # q.validate [^./]
    end
    # convert input to format for text file name
    text_file
    # change into text subdirectory
    Dir.chdir('txt') do
        #does file already exist?
        if File.exist?(@file_name) == false
            # create new file
            File.new(@file_name, "w+")
            success_text("Hooray, you're ready to #{@input} every day\n")
        else
            error_text("Sorry, there is already a task with this name")
        end
    end
end



# Old new task method
# def new_task
#     system("clear")
#     puts "What would you like to call this task?"
#     puts "Please make it short and easy to remember"
#     task_name = gets.chomp.downcase
#     dot = task_name.include? "."
#     if dot == false
#         file_name = task_name + '.txt'
#         file_name.gsub!(' ', '_')
#         # change into text subdirectory
#         Dir.chdir('txt') do
#             #does file already exist?
#             if File.exist?(file_name) == false
#                 # create new file
#                 File.new(file_name, "w+")
#                 puts "Hooray, you're ready to #{task_name} every day"
#             else
#                 puts "Sorry, there is already a task with this name"
#             end
#         end
#     else
#         puts "Sorry, the name can't include a '.'"
#     end
# end


# select files
def select_file(question)
    choices = []
    # list files in txt folder
    @filenames = Dir.entries(".")
    @filenames.delete_if {|task| task == '.'}
    @filenames.delete_if {|task| task == '..'}
    @filenames.each do |task|
        task.gsub!('_', ' ')
        task.gsub!('.txt', '')
        choices << task
    end
    # create welcome menu variable - can this go in index.rb?
    @prompt = TTY::Prompt.new
    @input = @prompt.select(question, choices)
end

# check if task is complete
def check_task_complete
    text_file
    current_data = File.read(@file_name)
    exists = current_data.include?(@date)
    if
        current_data.include?(@date) == false
        current_data << @date + ','
        File.write(@file_name, current_data)
        success_text("Task completed. Nice work!")
    else
        error_text("Whoops, looks like you've already marked this task complete on this day")
    end

end

# existing tasks method
def existing_tasks
    system("clear")
    # change directory to the text folder
    Dir.chdir("txt") do
        select_file("Which task did you do?")
        selection = @prompt.select("When did you complete #{@input}?") do |menu|
            menu.choice "Today", 1
            menu.choice "A different day", 2
            menu.choice "Go back", 3
        end
        case selection
        when 1
            @date = Date.today.to_s
            check_task_complete
        when 2
            @date = @prompt.ask("please add the date you completed the task?", convert: :date)
            if @date > Date.today
                puts "Hey there time traveller! It looks like this is in the future"
                puts "Please try again"
            else
                @date = @date.iso8601.to_s
                check_task_complete
            end
        when 3
            # need to revisit all the "back" options
            menu_prompt
        end
    end
end
            #     puts "Did you complete this today or a different day?"
            # puts "1. Today"
            # puts "2. A different day"
            # input = gets.chomp.to_i
        #     if input == 1
        #         date = Date.today.to_s
        #         file_name = complete + '.txt'
        #         file_name.gsub!(' ', '_')
        #         current_data = File.read(file_name)
        #         # this is currently a string, need to work on staring as an array
        #         if
        #             current_data.include?(date) == false
        #             current_data << date + ','
        #             File.write(file_name, current_data)
        #             puts current_data
        #         else puts "Whoops, looks like you've already marked this task complete on this day"
        #         end
        #     elsif input == 2
        #        green puts "Please add the date you completed the task in the format YYYY-MM-DD"
        #         # exception handling when date input doesn't meet ISO8601 format
        #         begin
        #             date = Date.iso8601(gets)
        #         rescue
        #             puts "Whoops, we didn't get that. Please make sure the date is in YYYY-MM-DD format"
        #             puts "e.g. 2020-12-18"
        #         end
        #         if date > Date.today
        #             puts "Hey there time traveller! It looks like this is in the future"
        #             puts "Please try again"
        #         else 
        #             file_name = complete + '.txt'
        #             file_name.gsub!(' ', '_')
        #             current_data = File.read(file_name)
        #             # this is currently a string, need to work on staring as an array
        #             if current_data.include?(date.to_s) == false
        #                 current_data << date.to_s + ','
        #                 File.write(file_name, current_data)
        #                 else puts "Whoops, looks like you've already marked this task complete on this day"
        #             end
        #        green end
        #     else  # Clear the screen
        #         system("clear")
        #         puts "Sorry, we didn't understand that"
        #     end
        # else  # Clear the screen
        #     system("clear")prompt = TTY::Prompt.newldn't find a task with that name"



# delete tasks method
def delete_task
    system("clear")
     # change directory to the text folder
    Dir.chdir("txt") do
        select_file("Which task would you like to delete?")
        text_file
        # confirmation
        prompt = TTY::Prompt.new
        if prompt.yes?("Are you sure you want to delete #{@input}?")
            File.delete(@file_name)
            message_text("\nTask deleted\n")
            # puts "\nTask deleted\n"
        else
            message_text("\nTask not deleted\n")
            # puts "\Task not deleted\"
        end
    end
end


# error text
def error_text(text)
    error = Pastel.new
    puts error.white.on_red.bold(text)
end

# success text
def success_text(text)
    success = Pastel.new
    puts success.black.on_bright_green.bold(text)
end

# message text
def message_text(text)
    message = Pastel.new
    puts message.bright_blue(text)
end