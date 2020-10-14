Feature: Todo functionality tests
  Feature to test functionality of the ToDo application

Background::
  Given I am on the ToDo application home page

@todo_test_1
Scenario: Add a to-do and confirm that it was added to the list
  Given I type a task into the ToDo list prompt
  When I press enter
  Then my task appears in the list

@todo_test_2
Scenario: Complete a to-do and confirm that it was completed
  Given I have a task on the ToDo list
  When I complete a task
  Then my task is completed


@todo_test_3
Scenario: Delete a to-do and confirm that it was removed from the list
  Given I have a task on the ToDo list
  When I delete a task
  Then my task is deleted