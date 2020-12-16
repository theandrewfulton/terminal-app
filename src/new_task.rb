    puts "What would you like to call this task?"
    puts "Please make it short and easy to remember"
    task_name = gets.chomp.gsub!(' ', '_')
    #does file already exist?
    if File.exist?('#{task_name}.txt') == false
        # create new file
        File.new('#{task_name}.txt', "w+")
        puts "Hooray, you're ready to #{task_name} every day"
        # options
    else
        puts "Sorry, there is already a task with this name"
    end