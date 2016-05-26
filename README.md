# Wikibed
### A safe place to rest your wiki pages

Wikibed was created for users to browse, create, and edit public and private wiki pages. The application includes:
- a responsive design
- user account creation, sign in, and sign out
- email confirmations and integration through SendGrid
- standard and premium accounts with streamlined upgrading
- endless (or infinite) scrolling index view

Check out a live demo of this app at https://wikibed.herokuapp.com/

![Wikibed screenshot](http://www.joshuazapata.com/img/wikibed_screen.png)

## Other details

* Ruby version 2.3.0
* Rails version 4.2.5

* Configuration

````bash
git clone https://github.com/joshuazap/wikibed.git
bundle install --without production
````

* Database creation

````bash
rake db:create
````

* How to run the test suite

````bash
rspec spec
````

* Deployment instructions

This app is deployed as a live demo at https://wikibed.herokuapp.com/

If you are interested in learning how to deploy Ruby on Rails apps on Heroku or you have questions, feel free to contact me!
