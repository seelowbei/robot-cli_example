# TEMPLATE

template generates from `rails new rails-template --webpack=react -d=postgresql --skip-coffee`

## Ruby version
- `ruby-3.0.1`

## Rails version
- `'rails', '~> 6.0.3'`

## Credentials
- `EDITOR=vim rails credentials:edit --environment development`

## Setup
- `bundle install` to install ruby packages
- `yarn` to install frontend packages
- `rails db:create` create db
- `./bin/webpack-dev-server` start webpack dev server
- `rails s` to start server
