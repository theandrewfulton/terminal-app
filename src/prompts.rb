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
        q.validate ->(input) { input =~ /^[a-zA-Z0-9'\s]*$/}
        q.messages[:valid?] = "Your tasks can only have letters, numbers, apostrophies and spaces in their names. Please try again"
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

# existing tasks method
def existing_tasks
    system("clear")
    # change directory to the text folder
    Dir.chdir("txt") do
        select_file("Which task did you do?")
        selection = @prompt.select("When did you complete #{@input}?") do |menu|
            menu.choice "Today", 1
            menu.choice "A different day", 2
        end
        case selection
        when 1
            @date = Date.today.to_s
            check_task_complete
        when 2
            @date = @prompt.ask("please add the date you completed the task?", required: true, convert: :date)
            if @date > Date.today
                error_text("Hey there time traveller! It looks like this is in the future")
                error_text("Please try again")
            else
                @date = @date.iso8601.to_s
                check_task_complete
            end
        end
    end
end

# visualise tasks method
def visualise_task
    system("clear")
    # change directory to the text folder
    Dir.chdir("txt") do
       select_file("Which task would you like to see?")
       text_file
    #    read file contents
       current_data = File.read(@file_name)
        # convert file contents to array
        data_array = current_data.split(',')
        dates_array = []
        data_array.each do |date|
            dates_array << date.split('-')
        end
        # ignore all array entries that aren't for the current year
        date = Time.new
        date = date.strftime('%Y')
        dates_array.delete_if {|year| year[0] != date}
        # keep the month entry
        dates_array.each do |date|
            date.delete_at(0)
            date.delete_at(1)
        end
        # flatten the array to a single level
        dates_array =  dates_array.flatten(1)
        # Month arrays
        january = ["January", ""]
        february = ["February", ""]
        march = ["March", ""]
        april = ["April", ""]
        may = ["May", ""]
        june = ["June", ""]
        july = ["July", ""]
        august = ["August", ""]
        september = ["September", ""]
        october = ["October", ""]
        november = ["November", ""]
        december = ["December", ""]
        # For every entry, add an asterisk (*) in index position 1 of the corresponding month array
        dates_array.each do |month|
            if month == '01'
                january[1] += " * "
            elsif month == '02'
                february[1] += " * "
            elsif month == '03'
                march[1] += " * "
            elsif month == '04'
                april[1] += " * "
            elsif month == '05'
                may[1] += " * "
            elsif month == '06'
                june[1] += " * "
            elsif month == '07'
                july[1] += " * "
            elsif month == '08'
                august[1] += " * "
            elsif month == '09'
                september[1] += " * "
            elsif month == '10'
                october[1] += " * "
            elsif month == '11'
                november[1] += " * "
            elsif month == '12'
                december[1] += " * "
            end
        end
        # add each month array to the rows array for terminal-table
        rows = [january, february, march, april, may, june, july, august, september, october, november, december]
        # create the table with the year in the title using Artii
        year_art = Artii::Base.new
        table = Terminal::Table.new :title => "#{year_art.asciify(date)}", :rows => rows
        # print the table
        background = Pastel.new
        puts background.on_magenta(table)
        # count the array for the current year
        # count the original array and output number of entries
        message_text("This task was successfully completed #{dates_array.count} times in #{date}")
        message_text("You have completed this task #{data_array.count} times overall")
        @prompt.keypress("Press space or enter to continue", keys: [:space, :return])
        system("clear")
    end
end

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
            success_text("\nTask deleted\n")
        else
            message_text("\nTask not deleted\n")
            # puts "\Task not deleted\"
        end
    end
end