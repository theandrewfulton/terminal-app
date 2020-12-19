# text file method
def text_file
    @file_name = @input + '.txt'
    @file_name.gsub!(' ', '_')
end