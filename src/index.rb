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
message_text("Navigate through the menus using the arrow keys. Then use Enter to make a selection.

When it comes to inputting dates, the application parses your input into ISO8601 format. It is rather good, however for the best experience please enter dates in the format 'YYYY-MM-DD'

Some prompts may require you to answer Yes or No. In this case, you will need to type Y for Yes or N for No, followed by Enter.

The following command line prompts can also be used as a shortcut to the selection menu of each feature:
- -n, --new
    - Opens a dialogue allowing the user to add a new task to track. Once confirmed, opens the main menu.
- -c, --complete
    - Opens a dialogue allowing the user to select a task to mark as complete and prompts for the date. Application exits.
- -v, --view
    - Opens a dialogue allowing the user to select a task to see visualised. The calendar view is then shown. When the user is finished the application exits.
- -d, --delete
    - Opens a dialogue allowing the user to select a task to delete. Once confirmed, application exits.
- -h , --help
    - Displays this help section

If you have any questions or need help, please see the README located in the application's main directory or contact the developer on Twitter at https://twitter.com/theandrewfulton

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
elsif ARGV[0] == "-c" || ARGV[0] == "--complete"
  existing_tasks
  exit
elsif ARGV[0] == "-n" || ARGV[0] == "--new"
  new_task
  menu_prompt
elsif ARGV[0] == "-v" || ARGV[0] == "--view"
  visualise_task
  exit
elsif ARGV[0] == "-d" || ARGV[0] == "--delete"
  delete_task
  exit
else
    menu_prompt
end
