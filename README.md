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

# API Endpoints

## All Pokemons (10 per page)

- **GET** `http://localhost:3000/api/v1/pokemons or http://localhost:3000/api/v1/pokemons?page=<page_number>`

  Retrieves a list of all Pokemons, with a maximum of 10 Pokemons per page.

  **Errors:**
  - Not Found (404): This error occurs when no Pokemons are found in the database.

## Get a Pokemon

- **GET** `http://localhost:3000/api/v1/pokemons/:id`

  Retrieves a specific Pokemon by its ID.

  **Errors:**
  - Not Found (404): This error occurs when a Pokemon with the corresponding ID is not found in the database.

## Create a Pokemon

- **POST** `http://localhost:3000/api/v1/pokemons`

  Creates a new Pokemon.

   **Request Body:**

      {
        "pokemon": {
        "name": "string",
        "type_1": "string",
        "type_2": "string",
        "total": "integer",
        "hp": "integer",
        "attack": "integer",
        "defense": "integer",
        "sp_atk": "integer",
        "sp_def": "integer",
        "speed": "integer",
        "generation": "integer",
        "legendary": "boolean"
        }
      }

  **Request Headers:**

  Content-Type: application/json
  
  **Status:**
  - Created (201): The Pokemon was successfully created.

  **Errors:**
  - Unprocessable Entity (422): This error occurs when the app is not able to create a Pokemon.
  - Bad Request (400): This error occurs when the request body does not follow the expected format.

## Update a Pokemon

- **PUT** `http://localhost:3000/api/v1/pokemons/:id`

  Updates an existing Pokemon by its ID.

  **Request Body:**

      {
        "pokemon": {
        "name": "string",
        "type_1": "string",
        "type_2": "string",
        "total": "integer",
        "hp": "integer",
        "attack": "integer",
        "defense": "integer",
        "sp_atk": "integer",
        "sp_def": "integer",
        "speed": "integer",
        "generation": "integer",
        "legendary": "boolean"
        }
      }

  **Request Headers:**

  Content-Type: application/json

  **Errors:**
  - Unprocessable Entity (422): This error occurs when the app is not able to update a Pokemon.
  - Bad Request (400): This error occurs when the request body does not follow the expected format.


## Delete a Pokemon

- **DELETE** `http://localhost:3000/api/v1/pokemons/:id`

  Deletes a specific Pokemon by its ID.

  **Status:**
  - No Content (204): The Pokemon was successfully deleted.

Note: Please replace `:id` in the URLs with the actual ID of the Pokemon you want to retrieve, update, or delete.
