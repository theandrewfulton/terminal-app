require "tty-prompt"

# Welcome message
# create welcome menu variable
@prompt = TTY::Prompt.new


def welcome_menu
user_input = @prompt.select("What would you like to do?") do |menu|
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