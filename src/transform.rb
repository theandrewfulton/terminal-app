# text file method
def text_file
    @file_name = @input + '.txt'
    @file_name.gsub!(' ', '_')
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