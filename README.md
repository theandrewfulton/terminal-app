# README - Daily Goal Tracker

## Source

The source code for this project is available at [https://github.com/theandrewfulton/terminal-app](https://github.com/theandrewfulton/terminal-app)

## Software Development Plan

### Statement of Purpose and Scope

- describe at a high level what the application will do
- identify the problem it will solve and explain why you are developing it
- identify the target audience
- explain how a member of the target audience will use it

The Daily Goal Tracker allows users to create an activity they would like to do every day and then enables them to track it visually. It is inspired by [Simone Giertz's Every Day Calendar](https://www.youtube.com/watch?v=-lpvy-xkSNA) (correct reference attribution).

This enables people to keep track of activities they want to do each day that may form part of a larger goal, such as meditating every day or going for a walk every day. Some people struggle with motivation when it comes to these types of tasks and seeing their progress visually may help with this. The Daily Goal Tracker presents this in a simple way.

The target audience for this application is people with long term goals to do something every day, whether it is meditation, exercise, brushing their teeth or making their bed.

Users will create a new task to track. Each day they complete their daily task, they start the app and select they have completed it. The Daily Goal Tracker then shows them this visually and gives them information about how many days in a row they have achieved their goal and how many days total they have completed it over a year. They can also view this visualisation at any time as well as creating new tasks to track and deleting old ones.

### Features

- at least THREE features
- describe each feature

Note: Ensure that your features above allow you to demonstrate your understanding of the following language elements and concepts:
- use of variables and the concept of variable scope
- loops and conditional control structures
- error handling

#### Create a new task to track

Users have the option of creating a new task to track and input a name for the task. For example "Don't bite your nails". This will be persistent when the user exits the app and re-opens it.

#### Input whether or not the task was completed on a given day

On a given day, users can open the app and mark a task as having been completed for the day. If they forget to log it, they can nominate dates it was completed retroactively. It doesn't have to be marked on the day it happened. This will be persistent when the user exits the app and re-opens it.

### See task progress visually

The user can see the number of days they have completed the task visually in the terminal at any time. They can also see the number of days in a row they have completed their task as well as the total number of days they have completed it.

### User Interaction

- how the user will find out how to interact with / use each feature
- how the user will interact with / use each feature
- how errors will be handled by the application and displayed to the user

After the application is installed, users will have access to this README as well as additional documentation when they type ```./daily-task -h``` or ```./daily-task --help```. Each feature is accessed via menus inside the application that briefly describes each feature and provides the user with prompts.

How the user will interact with/use each feature


Error Handling


When the application is opened, the user will be presented with the option to create a new task to track. They will then be prompted to create a name, for example: "Don't bite your nails". This will then be saved to a text file so that it is persistent when the user exits the app and re-opens it.



### Control Flow Diagram

## Implementation Plan

The implementation plan for this project can be found [on Trello](https://trello.com/b/HWYFRejK/terminal-app)

## Help Documentation

- steps to install the application
- any dependencies required by the application to operate
- any system/hardware requirements