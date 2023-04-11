# Rails Pokemon API
  API project that uses a CSV as database seeding. The project contains CRUD actions, pagination and Rspec testing.

Tools:
  * Ruby 3.1.2
  * Rails 7.0.4
  * SQLite 3.37.2 (For this project, I decided to go for simplicity. Taking into account production environment and scalabilty, a database like Postgresql would be a much better option)


How to run project:

  - Clone repository

    `git clone https://github.com/alej37/pokemons_api.git`

  - Install dependencies

    `bundle install`

  - Setup database:
    
    `rails db:create db:migrate db:seed`
  
  - Run server:
    
    `rails server`
  
  - Run tests:

    `bundle exec rspec`

API Endpoints

  - All pokemons (10 by page)

    ` GET http://localhost:3000/api/v1/pokemons `

    <font color="red"><i>Errors: Not Found (404), this error occurs when no Pokemons are found in the database.</i></font>


  - Get a Pokemon

    ` GET http://localhost:3000/api/v1/pokemons/id`

    <font color="red"><i>Errors: Not Found (404),  this error occours when Pokemon with corresponding id is not found in database.</i></font>


  - Creates a Pokemon

    `POST http://localhost:3000/api/v1/pokemons, status: Created(201)`

    <font color="red"><i>Errors: Unprocessable entity(422), this error occours when app is not able to create a Pokemon.</i></font>

  - Updates a Pokemon

    `PUT http://localhost:3000/api/v1/pokemons/id`

    <font color="red"><i>Errors: Unprocessable entity(422), this error occours when app is not able to update a Pokemon.</i></font>

  - Deletes a Pokemon

    ` Delete http://localhost:3000/api/v1/pokemons/id, status: No Content(204)`