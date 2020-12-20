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
message_text("The information in this section can also be accessed with the commands: ```./install-run.sh --help``` and ```./install-run.sh -h```

Navigate through the menus using the arrow keys. Then use Enter to make a selection.

When it comes to inputting dates, the application parses your input into ISO8601 format. It is rather good, however for the best experience please enter dates in the format "YYYY-MM-DD"

Some prompts may require you to answer Yes or No. In this case, you will need to type Y for Yes or N for No, followed by Enter.

If you have any questions or need help, please contact the developer on Twitter at [twitter.com/theandrewfulton](https://twitter.com/theandrewfulton)

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
