# Gamification

[![Code Climate](https://codeclimate.com/github/hyperoslo/gamification.png)](https://codeclimate.com/github/hyperoslo/gamification)
[![Build Status](https://travis-ci.org/hyperoslo/gamification.png)](https://travis-ci.org/hyperoslo/gamification)

Gamification is a collection of models for Ruby on Rails that allows you to make anything a game.

## Installation

Add this line to your application's Gemfile:

    gem 'gamification'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gamification

Install the migrations:

    rake gamification:install:migrations
    
Run the migrations:

    rake db:migrate

## Usage

Gamification really only has two models: `Task` and `Scoring`. A task has many scorings and a
scoring belongs to a task. Simple. What your tasks are and who you will be rewarding is up
to you.

For example, imagine that you want to reward your users for reading articles on your site.

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  rewardable
end

# app/models/article.rb
class Article < ActiveRecord::Base
  taskable
end
```

`rewardable` declares that your model is eligible to receive rewards, whereas `taskable`
declares that it has one.

```erb
<!-- app/views/articles/show.html.erb -->
<%= render @article %>
<%= complete @article, for: current_user %>
```

The `complete` helper renders a button towards the end of the article that you can click to
receive your reward for reading it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Hyper made this. We're a digital communications agency with a passion for good code,
and if you're using this library we probably want to hire you.

## License

Gamification is available under the MIT license. See the LICENSE file for more info.
