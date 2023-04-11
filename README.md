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
