# README

## Tests
* Front End - UI tests with Cucumber / Capybara's
* Controllers - Response status codes, template rendering
* Models - Game logic and validation

* Have I tested - ...

## Reflection

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

Friday 10 Nov
* To review:
* What are flash messages and how and they used with things like validation?
* Validating via custom methods

Monday 13 Nov
* Use present tense/active voice when writing assertions for cucumbers.
* Remember scoping changes depending on the environment you are working with.
* Research call method.
* Start new game should be separate feature.
* Player is more specific then user when writing tests.
* Be more specific with what I'm testing, don't worry about the other small stuff as much. Focus on the key issues.
* Be clear with naming intent for what the user is doing.

Tuesday 14 Nov
* Use before_save :my_method to perform work on values before saving to DB.
* Testing: Add describe blocks to separate code into appropriate areas, and test based on vars and methods.
* Testing: #'s describe instance methods, .'s describe class methods

Wednesday 15 Nov
* Avoid writing tests that only end up testing the Rails framework. Routes specs tend to do this. Only test the things that you change.
* Review: Pluck

Wednesday 22 Nov
* There are separate db's created for each test environment. If one DB is updated, rolled back etc, then you will need to do the same to test DB also to keep the data consistent.
* RAILS_ENV=test rails db:rollback && rails db:migrate

Thursday 23 Nov
* Review Hooks
