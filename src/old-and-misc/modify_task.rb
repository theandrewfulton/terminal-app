# unused code copied from new_task
# class NewTask
#     def initialize
#         @dates = []
#     end
#     def task_name(name)
#         @name = name
#     end
#     # add date to task
#     def add_date(date)
#         date = AddDate.new(date)
#         @dates << add_date
#     end
# end
require './new_task'
require './add_date'

class ModifyTask
    def initialize(name, date)
end


# add new date to an array of strings containing dates
# save the updated array to the relevant text file