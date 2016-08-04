## Blog Infrastructure Biolerplate

# This branch contains infrastructure related boilerplate code that provides the following:
- a Ruby/Rails container
- a PostgreSQL container

# Usage (in this order):
- generate a new app with docker-compose run web rails new . --force --database=postgresql --skip-bundle
- uncomment gem 'therubyracer', platforms: :ruby in Gemfile to provide a js runtime
- run docker-compose build
- replace the contents of config/database.yml with the contents in db_config.yml at the root of this repo
- docker-compose up
- docker-compose run web rake db:create
- docker-compose run web rake db:migrate
- app should be exposed on http://localhost:3000

