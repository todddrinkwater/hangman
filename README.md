# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Tuesday 7 Nov
* No model for game. What is the best approach to creating this?

Wednesday 8 Nov
* How do I go about testing the user display for a clue that's length could change each game?
* Ditto with numbers
* Issues with deprecated tags ~@javascript ~@no-database-cleaner ~@no-js-emulation

* Add guesses table with guess row
* Create relationship between Game and Guesses class
* One game can have many guesses, many guesses belong to one game

Thursday 9 Nov
* Issue: Game controllers index action creates a new game every time we are redirected to that route.
* Fix: Create button that will post to a create action, then redirect from create to show. Show template will need to be created to replace index.html.erb.
* Key learnings:
  * - Creating a hidden_field is form inputs is f.hidden_field(:game_id, value: params[:id]) Where the key is the first arg and the value is the second.