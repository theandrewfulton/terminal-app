# required files
require_relative 'prompts'
require_relative 'transform'

# required ruby classes and gems
require 'date'
require 'time'
require 'terminal-table'
require 'artii'
require 'tty-prompt'
require 'pastel'

# Help method
def help
puts "Welcome to Daily Task Tracker! When you have finished with this help guide, you can open the application with ./install-run.sh

Navigate through the menus using the arrow keys. Then use Enter to make a selection.

When you are prompted to select a task, please ensure you type it exactly and then press Enter.

If you type something Daily Task Tracker doesn't understand, you will be returned to the main menu.

If you are prompted to type a date, please ensure it is in the format YYYY-MM-DD.

Some prompts may require you to answer Yes or No. In this case, you will need to type Y for Yes or N for No, followed by Enter.

If you have any questions or need help, please contact the developer on Twitter at https://twitter.com/theandrewfulton

Thank you and have fun!"
end


# visualise tasks method
def visualise_task
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
        puts "Which task would you like to see?"
        complete = gets.chomp
        if filenames.include?(complete) == true
            file_name = complete + '.txt'
            file_name.gsub!(' ', '_')
            # read file
            current_data = File.read(file_name)
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
            # puts "This task was successfully completed #{dates_array.count} times in #{date}"
            # count the original array and output number of entries
            message_text("This task was successfully completed #{dates_array.count} times in #{date}")
            message_text("You have completed this task #{data_array.count} times overall")
            # puts "You have completed this task #{data_array.count} times overall"

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
# command line arguments
def gets
    STDIN.gets
  end
# command line arguments
if ARGV[0] == "-h" || ARGV[0] == "--help"
		puts help
		exit
else
    menu_prompt
end
