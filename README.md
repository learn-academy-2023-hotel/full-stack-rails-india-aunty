## Full Stack Rails 1/29/24 India

## Process for github empty repo
- Click the github classroom link
- Create team name
- Accept the assignment and refresh screen to allow github to create an empty repo.
- ***STOP! Just need the repo to stay empty.***  

## Process for local app
- Create a new Rails app on the desktop: $ rails new rails-full-stack -d postgresql -T
- $ cd rails-full-stack
- Create a database: $ rails db:create
- Begin the rails server: $ rails server
- In a browser navigate to: http://localhost:3000
- Connect the local app and the empty github repo: Copy the `$ git remote add origin` command from empty repo
- Ensure a main branch exists: `$ git checkout -b main`
- Make an initial commit to the main branch:  
    a) `$ git status`  
    b) If you are tracking all the files and folders displayed: `$ git add .`  
    c) `$ git commit -m "initial commit"`  
    d) `$ git push origin main`  

## All other team members after the initial commit
- Join the github classroom team
- Clone the github repo for your team
- Create the empty database: `$ rails db:create`
- Migrate all the changes: `$ rails db:migrate`
- Add all dependencies: `$ bundle`  
***NOTE: You will have to scaffold/stub more data entries in the rails console because the database is saved locally.***
   
## Initial setup 

### Goal of App
- Comedy full stack rails app
- Model: Comedy with joke, punch_line. Both will strings.

### Steps to perform initial setup
- Create a branch to add new features: `$ git checkout -b dependencies`
- Add the dependencies for RSpec:
    - `$ bundle add rspec-rails`
    - `$ rails generate rspec:install`
- Generate the model with appropriate columns and data types: `$ rails g model Comedy joke:string punch_line:string`
- Save changes to db schema: `$ rails db:migrate`
- Generate the controller: `$ rails g controller Comedy`

## Restful routes
[Review of restful routes](https://github.com/learn-academy-2023-india/syllabus/blob/main/rails/restful-routes-crud.md)  

- RESTful routes: index, show, new, create, edit, update, destroy
- HTTP verbs: get, post, put, patch, delete
- CRUD: Create, Read, Update, Delete

- RESTful routes: methods within the controller, aka action method, that map to an HTTP verb to allow crud actions to be performed within the application  
***NOTE: The order that restful routes need to be place on the routes.rb is INCSEUD (ink-say-ud): index, new, create, show, edit, update, destroy.***

### crud action -> http verb -> restful route
    read -> get -> index
    read -> get -> show
    read -> get -> new
    create -> post -> create
    update -> patch -> update
    update -> put -> update
    delete -> delete -> destroy  

## Plans for application
### Scaffolding
- scaffolding: stubbing, create initial data entries using the rails console 
`> Comedy.create(joke: 'What do you for a sad web developer?', punch_line: 'You console them.')`  
`> Comedy.create(joke: 'What do bees sit on?', punch_line: 'Their behind.')`  
`> Comedy.create(joke: "Why can't you trust a burrito", punch_line: 'Because it will spill the beans.')`  
`> Comedy.create(joke: 'Why does a computer go to the bar? ', punch_line: 'To get a screenshot.')`  
`> Comedy.create(joke: 'Why did the Math Book look sad?', punch_line: 'Because it had too many problems!')`    

### Establish MVP
- MVP: Minimum Viable Product, minimum requirements to have a basic functional application
  - Allow a user to see all the data in the database --> index
  - Allow a user to see more information about a single data entry --> show
  - Allow a user to create data entries --> new, create

## Work flow
1. Create a new branch for each feature
2. Add the restful route to the controller in app/controllers
3. Create a route for the restful route (action method) in config/routes.rb
4. Create a views file for that restful route in app/views
5. Verify user experience

## display all the instances 
branch: index     
index restful route: display all the instances in the database 

read -> get -> index   

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
  get '/jokes', to: 'comedy#index', as: 'jokes' 
```

3. views  
Create a views file that has the same name as the restful route that will iterate across the array stored by the instance variable. Display each instance on a separate line.
- use erb syntax to reference ruby code 
    - `<%= %>` used to display values
    - `<% %>` used to reference ruby code that will not be displayed

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

## display one instance
branch: show 

show restful route: displays one instance from the database 

read -> get -> show  

1. controller  
The params hash will be used to abstract the value of the primary key from the url.
```rb
def show
  @one_joke = Comedy.find(params[:id])
end
```

2. routes
- use the same url as the index, add the requirement of a param
```rb
get '/jokes/:id', to: 'comedy#show', as: 'joke'
```

3. views
- use dot notation to display the values of each applicable column

4. Verify user experience. Remember to provide an applicable primary key from the database.
- Enter `http://localhost:3000/jokes/2` in the browser

## create a new instance
branch: new-instance
- Instead of creating a new instance in the rails console:  
`> Comedy.create(joke: 'Why do programmers prefer dark mode?', punch_line: 'Because light attracts bugs.')`
- User input will be used to create a new instance and then saved to the database using the new and create restful routes.  

### new 
new restful route: a html form that collects user input for the values that will be saved for a new instance or data entry in the database

read -> get -> new  

1. controller
```rb
  def new
    @new_joke = Comedy.new
  end
```

2. route
```rb
  get '/jokes/new', to: 'comedy#new', as: 'new'
```

3. views
```html
<h2>Add a New Joke</h2>
# form_with helper is connecting to a model
# reference the instance variable which is the place holder for the empty instance that will accept values for each attribute or column in the database
<%= form_with model: @new_joke do |form| %>

  <%= form.label :joke %>
  <%= form.text_field :joke %>

  <br>
  <%= form.label :punch_line %>
  <%= form.text_field :punch_line %>

  <br>
  # the submit button then will look for the create method/restful route associated with this new method/restful route 
  <%= form.submit 'Add Joke' %>
<% end %>
```

4. Verify user experience
- To see the form:   
`http://localhost:3000/jokes/new`  

### create
create restful route: saves a new instance or data entry in the database, no views will be required for this route because its role is to save data not display it.

create -> post -> create  

1. controller  
Create restful route will restrict how the user interacts with the database using the following:  

    a) `private`: prevents access to certain data/methods across the application

    b) strong params: method listed under private to control what attributes can be created by the user  

    c) `params.require()`: establishes which model will have the requirements 

    d)`.permit()`: establishes which attribute(s) the user can provide value(s)

```rb
  def create
    # create takes the strong params method as argument
    @new_joke = Comedy.create(joke_params)
    # redirect to the index page if the new instance is valid
    if @new_joke.valid?
      # alias is referenced with `_path`
      redirect_to comedies_path
    end
  end

  # restrictions
  private
  # strong params method
  def joke_params
    # allows the user to provide values for each attribute or column
    params.require(:comedy).permit(:joke, :punch_line)
  end
```

2. routes
`post '/jokes', to: 'comedy#create'`

3. Verify user experience:  

    a) Go to the form: `http://localhost:3000/jokes/new`  

    b) Input values for each field 

    c) Click the button to save the new instance to the database 

    d) If the instance is valid, the index page should be displayed  

## Additional notes
Rails will require the alias for the index restful route to be the model name
  - plural for the index
  - singular for the show  

To see available urls (routes created from the config/routes.rb)  
  - To see on the browser: `http://localhost:3000/rails/info/routes`
  - To see in the terminal: `$ rails routes -E`  

Views file will be referencing the instance variable used on the applicable method/restful route

## User experience
branch: link  
- Add navigation to the different views/pages
- Remove the punch line from the index view

### Navigate to the show page
A link will be created on the index page. To create a URL link to the show route for a specific instance, we use the ID in the URL. Therefore, the path will receive the instance as an argument.  
`<%= link_to "Joke: #{chuckle.joke}",  comedy_path(chuckle) %>`  
***NOTE: Because link_to helper method requires a string for the text on the link, we used string interpolation to abstract the value at the joke key (attribute).***

## Ice Box
features that enhance the user experience beyond the MVP 
  - Allow a user to modify an existing instance in the database --> edit, update
  - Allow a user to remove an existing instance in the database --> destroy

## modify an existing instance
User input will be used to modify an existing instance and then save it to the database using the edit and update restful routes. 
branch: modify

### edit
edit restful route: provides an html form that displays the values for an existing instance, needs a params id to specify which instance is being updated   

read -> get -> edit  

1. controller
```rb
  def edit
    @modified_joke = Comedy.find(params[:id]) 
  end
```

2. routes - Make sure to follow the INCSEUD pattern on the routes file

3. views - Make sure to specify the patch method

4. user experience  
`http://localhost:3000/jokes/6/edit`  

### update
update restful route: used to saved the modifications to an instance, needs a params id to specify which instance is being updated, no view necessary   

update -> patch -> update  

1. controller
```rb
  def update
    # abstract the instance
    @modified_joke = Comedy.find(params[:id])
    # update the permitted attributes as specified as specified by the strong params 
    @modified_joke.update(joke_params)
    # if valid redirect to the show page
    if @modified_joke.valid?
      redirect_to comedy_path
    end
  end
```

2. routes: make sure to use the patch http verb

3. user experience

## remove an existing instance
destroy restful route: used to remove an existing instance, needs a params id to specify which instance is being updated, no view necessary  

delete -> delete -> destroy  

1. controller
```rb
  def destroy
    @no_joke = Comedy.find(params[:id])
    @no_joke.destroy
    redirect_to comedies_path
  end
```
2. route: http verb delete

3. views  
    a) need a button to trigger the method  
    b) create alias for destroy RESTful route  
    c) using helper method button_to which takes in three arguments:   
      - text to be on button   
      - destroy path that takes in the variable  
      - method option that maps to the delete http verb  
    d) place button on show.html.erb    
`<%= button_to 'Delete this joke', destroy_path(@one_joke), method: :delete %>`    

4. user experience