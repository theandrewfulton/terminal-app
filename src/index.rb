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
message_text("Welcome to Daily Task Tracker! When you have finished with this help guide, you can open the application with ./install-run.sh

Navigate through the menus using the arrow keys. Then use Enter to make a selection.

When you are prompted to select a task, please ensure you type it exactly and then press Enter.

If you type something Daily Task Tracker doesn't understand, you will be returned to the main menu.

If you are prompted to type a date, please ensure it is in the format YYYY-MM-DD.

Some prompts may require you to answer Yes or No. In this case, you will need to type Y for Yes or N for No, followed by Enter.

If you have any questions or need help, please contact the developer on Twitter at https://twitter.com/theandrewfulton

Thank you and have fun!")
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
