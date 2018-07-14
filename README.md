# README

This is the project for "Architetture software e sicurezza informatica" course held by L. Querzoni and R. Beraldi.

## Authors

[Luigi Russo](https://gitlab.com/lrusso96), [Matteo Salvino](https://gitlab.com/matteosalvino)

## What is required

This is a RoR project, so first you need to set up Rails

* Rails version

    5.2.0

* Ruby version

    Ruby 2+ preferred (2.3.0 is the default version in Gemfile)

* Other software needed

    Google Chrome is needed for some tests.

## How to run

First clone the repo, doing something like this

    git clone {Minerva.git}

Then you have to install all gems required. So simply run

    bundle install

Note: _"install" option isn't required in newer versions by the way_

Then you can initialize the database with

    rails db:migrate

You can optionally seed the database with default values (as in seed.rb)

    rails db:seed

Finally put the server up with

    rails s

_where the "s" is the alias of "server" option_


## How to run tests

Integration tests with

    cucumber

Models tests with

    rspec spec

Other tests

    rails t

## Dependencies

We developed a gem for this project. You can find it [here](https://gitlab.com/lrusso96/minerva_api)