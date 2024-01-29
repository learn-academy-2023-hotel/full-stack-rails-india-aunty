## Full Stack Rails 1/29/24 India

## Process for github empty repo

## Process for local app
- Create a new Rails app on the desktop: $ rails new rails-full-stack -d postgresql -T
- $ cd rails-full-stack
- Create a database: $ rails db:create
- Begin the rails server: $ rails server
- In a browser navigate to: http://localhost:3000
- Add the git remote from GitHub Classroom
- Ensure a main branch exists
- Make an initial commit to the main branch

- Create a branch to add new features: $ git checkout -b dependencies
Add the dependencies for RSpec:
$ bundle add rspec-rails
$ rails generate rspec:install
Generate the model with appropriate columns and data types: $ rails g model Comedy joke:string punch_line:string
$ rails db:migrate
Generate the controller: $ rails g controller Comedy

## Goal of App
- Comedy full stack rails app
- Model: Comedy with joke, punch_line. Both will strings.

https://github.com/learn-academy-2023-india/syllabus/blob/main/rails/restful-routes-crud.md

## Scaffolding the restful routes
- CRUD: Create, Read, Update, Delete
- RESTful routes: methods within the controller, aka action method, that map to an HTTP verb to allow crud actions to be performed within the application
- index, show, new, create, edit, update, destroy

- MVP: Minimum Viable Product, minimum requirements to have a basic functional application
    - index, show, new, create
    - 
- scaffolding: create initial data entries using the rails console
> Comedy.create(joke: '', punch_line: '')

crud action -> http verb -> restful route
read -> get -> index

## Work flow
1. Add the restful route to the controller in app/controllers
2. Create a route for the restful route (action method) in config/routes.rb
3. Create a views file for that restful route in app/views
4. Verify user experience

## index branch
- index: display all the instances in the database

1. controller
```rb
  def index
    @joke_list = Comedy.all
  end
```
2. routes
```rb
# define the url with the `get` http verb that calls the index method
# use `to:` instead of the hash rocket that is shown in the syllabus and ensure the url has a `/`
  get '/jokes', to: 'comedy#index' 
```
3. views
- create a view file that has the same name as the restful route that will iterate across the instance variable that is storing an array that contains all the instance in the database. Display each instance on a separate line
- use erb syntax to reference ruby code 
    - <%= %> used to display values
    - <% %> used to reference ruby code that will not be displayed

```html
<h1>India Comedy Factory</h1>
<ul>
  <% @joke_list.each do |chuckle|%>
    <li>
      Joke: <%= chuckle.joke %> Punch line: <%= chuckle.punch_line %>
    </li>
  <% end %>
</ul>
```
4. Verify user experience:
- Enter `http://localhost:3000/jokes` in the browser

require
permit
private