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

- structure of scaffolding
```rb
```

require
permit
private