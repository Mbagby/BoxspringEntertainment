# BoxspringPrototype

bundle install
rails db:create db:migrate db:seed
bundle exec rake stripe:prepare

rails s
