require_relative './add_date.rb'
# The commented out code below works but I'm worried it's too
# simplistic and won't actually achieve what I need it to.
# I'm wondering if I need to create a third class to store and modify tasks
class NewTask
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

# create object
# create a text file with name and spaces replaced with underscores
# add the name to the text file