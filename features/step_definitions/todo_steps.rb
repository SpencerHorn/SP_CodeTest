require 'pry'
require 'rspec'

$task = 'Complete Signal Path Code Challenge'

Given('I am on the ToDo application home page') do
  page_title = 'Angular2 • TodoMVC'
  @browser.goto 'http://todomvc.com/examples/angular2/'
  expect(@browser.title).to eq page_title
  $todos = @browser.elements(class: 'view').map(&:text)
  $completed_todos = @browser.lis(class: 'completed').map(&:text)
end

Given('I type a task into the ToDo list prompt') do
  @browser.text_field(class: 'new-todo').set($task)
end

When('I press enter') do
  @browser.send_keys :enter
end

Then('my task appears in the list') do
  $todos = @browser.elements(class: 'view').map(&:text)
  expect($todos).to include($task)
end

Given('I have a task on the ToDo list') do
  add_todo
end

When('I complete a task') do
  @browser.element(class: 'toggle').click
end

Then('my task is completed') do
  $completed_todos = @browser.lis(class: 'completed').map(&:text)
  expect($completed_todos).to include($task)
end

When('I delete a task') do
  @browser.label(text: $task).hover
  @browser.button(class: 'destroy').click
end

Then('my task is deleted') do
  $todos = @browser.elements(class: 'view').map(&:text)
  $completed_todos = @browser.lis(class: 'completed').map(&:text)
  expect($todos).not_to include($task)
  expect($completed_todos).not_to include($task)
end

def add_todo
  # TODO: write if statement to handle any tasks that may unexpectedly appear in the todo
  # or completed_todo task lists
  expect($todos.count).to eq 0
  expect($completed_todos.count).to eq 0
  @browser.text_field(class: 'new-todo').set($task)
  @browser.send_keys :enter
  added_todos = @browser.elements(class: 'view').count
  expect(added_todos).to eq $todos.count + 1
end