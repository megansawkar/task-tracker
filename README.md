## Task Tracker
**Task Tracker is self destructing to-do list application. It allows users to create a daily to-do list and automatically deletes any items still left on the list longer than 7 days.**

## The Details
* Ruby version 2.3.0
* Rails version 4.2.5

* Deployed with [Heroku](https://megansawkar-task-tracker.herokuapp.com/)

* Source code on [Github](https://github.com/megansawkar/task-tracker).

## Summary of What Was Learned
This project was created as part of the BLOC Software Engineering course. This was the first project I completed in the program. Here's a list of what I learned.

* I installed the Devise Gem for the first time, giving my app user authentication with sign-in/sign-out functionality. It was good practice and I got it working quickly and without any major hitches.
* I integrated the Factory Girl Gem to generate data for testing.
* I learned how to integrate the Faker Gem with the Factory Girl Gem to generate randomized fake data for the Factory Girl generator.
* I implemented Bootstrap and AJAX to allow for a to-do item to be deleted without reloading the webpage.
* I used Bootstrap to create a responsive design.
* I utilized the Ruby helper method distance_of_time_in_words to access the length of time since an item was added.
* I created a Rake task that automatically deletes items detected as older than seven days.

Created with my mentor at [Bloc](http://bloc.io).
