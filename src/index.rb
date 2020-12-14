require "tty-prompt"
require "artii"

# new task class
class New_Task
    # get short task name
    # get description
    # create text file
    # save task name and description to text file
end




# Welcome message
welcome_art = Artii::Base.new
puts welcome_art.asciify ('Daily Tasks')
# create welcome menu variable
@prompt = TTY::Prompt.new

def welcome_menu
user_input = @prompt.select("\n What would you like to do?\n") do |menu|
    menu.choice "Create a new task to track", 0
    menu.choice "Select an existing task to track", 1
    menu.choice "Show a task visually", 2
    menu.choice "Delete an existing task", 3
    menu.choice "Exit", 4
    end
end



if welcome_menu == 4
    puts "Goodbye"
    exit
end