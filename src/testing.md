# Testing

This document outlines the manual testing procedures used to ensure the application and its features work as intended as well as showing the current state of features.

## Create a new task

Following the on-screen prompts should result in a text file being created with the task name.
The task name should only contain upper and lower case letters, numbers and spaces. The file name should present everying as lowercase. Any other input should present the user with "Your tasks can only have letters, apostrophies numbers and spaces in their names. Please try again"

### Curent State: Passing

### Create task name containing forward slashes “/”

1. Select "Create a new task to track"
1. input "walk/run for 30 minutes"

Should result in Error

### Create task name containing full stops "."

1. Select "Create a new task to track"
1. input "Brush my teeth."

Should result in Error

### Create task name containing numbers

1. Select "Create a new task to track"
1. input "walk for 30 minutes"

Should present "Hooray, you're ready to walk for 30 minutes every day"

### Create task name containing an apostrophe "'"

1. Select "Create a new task to track"
1. input "Make Andrew’s bed"

Should present "Hooray, you're ready to make andrew's bed every day"

Once the task has been created. A corresponding text file will appear in the “txt” directory. The spaces will be replaced with underscored and the extension “.txt” added.
- walk_for_30_minutes.txt
- make_andrew’s_bed.txt


## Completing a task
Completing a task should only accept the current system date or parse date inputs into ISO8601 format before checking for duplicate entries and then writing to the appropriate text file.

### Curent State: Passing

### Complete a task today

1. Select “Select an existing task to track”
1. Select “walk for 30 minutes”
1. Select “Today”

Should present “Task completed. Nice work!”

The corresponding text file should contain the current system date in the format ‘YYYY-MM-DD,”

### Complete a task today agin

1. Select “Select an existing task to track”
1. Select “walk for 30 minutes”
1. Select “Today”

Should present “Whoops, looks like you've already marked this task complete on this day”

The corresponding text file should only contain the current system date once.

### Complete a task on a different date

1. Select “Select an existing task to track”
1. Select “walk for 30 minutes”
1. Select “A different day”
1. Input “14th November”

Should present “Task completed. Nice work!” - assuming the current system date isn’t the 14th November

The corresponding text file should contain the current system date and the 14th November of the current year in the format “YYYY-MM-DD,”

### Complete a task on a different date again

1. Select “Select an existing task to track”
1. Select “walk for 30 minutes”
1. Select “A different day”
1. Input “14th November”

Should present “Whoops, looks like you've already marked this task complete on this day”

The corresponding text file should only contain the current system date and the 14th November of the current year once each.

### Complete a task on an invalid date

1. Select “Select an existing task to track”
1. Select “walk for 30 minutes”
1. Select “A different day”
1. Input “31st February”

Should present “Cannot convert `31st Feb` to 'date' type” and wait for further input

### Complete a task given a month

1. Select “Select an existing task to track”
1. Select “walk for 30 minutes”
1. Select “A different day”
1. Input “March”

Should present “Task completed. Nice work!”
The corresponding text file should contain an additional entry for the 1st of March of the current year in the format “YYYY-MM-DD,”