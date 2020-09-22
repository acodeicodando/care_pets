# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Dependencies:

* Ruby version **2.5+**

* Rails **>= 6.0.3.3**

* PostgreSQL

## Setup

* To setup your dev environment follow the steps in your terminal

```
## clone the repository
git clone https://github.com/acodeicodando/care_pets.git

## enter in the directory
cd care_pets
## dont forget to edit your config/database.yml with postgres access
```

```
## install bundler and gems of the project
gem install bundler
bundle install
```

```
## create database structure and setup with initial data
rails db:drop db:create db:migrate db:seed
```

## Developing

* It's recommend to use the Visual Studio editor to code the project because have lot of extensions that can use and help you
* Edit your **config/database.yml** with postgres credentials
* To code the new feature follow
```
git checkout develop
git pull origin develop
git checkout -b feature/description-of-feature
```
* after the changes and tests are ok run

```
rspec .
git add .
git commit -am 'short description about the changes'
git push origin feature/description-of-feature
git checkout develop
git pull origin develop
git merge feature/description-of-feature
git push origin develop
```

* To code the a bug or fix follow
```
git checkout develop
git pull origin develop
git checkout -b fixes/description-of-fix
```
* after the changes and tests are ok run

```
rspec .
git add .
git commit -am 'short description about the changes'
git push origin fixes/description-of-fix
git checkout develop
git pull origin develop
git merge fixes/description-of-fix
git push origin develop
```

## Testing

* The project it's using the gem **Guard** to help with tests so just run

```
bundle exec guard
```

* and when you update some file, the tests will auto run

## Deploy

* This project it's hosted on the heroku in the address **https://care-pets.herokuapp.com/**

* When you need to do the deploy run

```
git checkout master
git merge develop
git push heroku master
```