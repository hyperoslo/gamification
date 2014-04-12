# Gamification

[![Gem Version](https://img.shields.io/gem/v/gamification.svg)](https://rubygems.org/gems/gamification)
[![Build Status](https://img.shields.io/travis/hyperoslo/gamification.svg)](https://travis-ci.org/hyperoslo/gamification)
[![Dependency Status](https://img.shields.io/gemnasium/hyperoslo/gamification.svg)](https://gemnasium.com/hyperoslo/gamification)
[![Code Climate](https://img.shields.io/codeclimate/github/hyperoslo/gamification.svg)](https://codeclimate.com/github/hyperoslo/gamification)
[![Coverage Status](https://img.shields.io/coveralls/hyperoslo/gamification.svg)](https://coveralls.io/r/hyperoslo/gamification)

Gamification is a collection of models for Ruby on Rails that allows you to make anything a game.

## Installation

Add this line to your application's Gemfile:

    gem 'gamification'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gamification

Install and run the migrations:

    $ rake gamification:install:migrations
    $ rake db:migrate

## Usage

Gamification consists of goals and rewards. A goal represents something that someone can do,
and a reward represents someone doing that thing. Simple. What your goals are and who you will
be rewarding is up to you.

For example, imagine that you want to reward your users for reading articles on your site.

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  rewardable
end

# app/models/article.rb
class Article < ActiveRecord::Base
  rewarding
end
```

`rewardable` declares that your users are eligible to receive rewards, whereas `rewarding`
declares that your articles have a reward.

### Rewardable

Rewardable models get a `has_many` relation to `Gamification::Reward`:

```ruby
user = User.first
user.rewards # => [<Reward>, <Reward>]
```

### Rewarding

Rewarding models get a `has_many` relation to `Gamification::Goal`:

```ruby
article = Article.first
article.goals # => [<Goal>, <Goal>]
```

### Medals

Goals can have medals. Medals are a nice way to make someone feel extra special. They can
have a name, a description and an image. When a user completes a goal that has a medal,
they will receive that medal:

```ruby
user = User.first
goal = Gamification::Goal.create

goal.create_medal do |medal|
  medal.name = 'Special Medal'
  medal.description = 'You are special! In a good way!'
end

goal.complete_for user

user.medals # => [<Medal>]
```

### Awarding rewards

Since goals can be anything, it's up to you to write the logic for awarding them. We
recommend using observers so you can keep it nice and isolated.

Here's an observer that rewards a user for answering a question:

```ruby
# app/models/answer_observer.rb
class AnswerObserver < ActiveRecord::Observer
  observe Answer

  def after_create(answer)
    answer.question.goals.each do |goal|
      goal.complete_for answer.user
    end
  end
end
```

We like to use rewards for easter eggs. For example, here's an observer that
rewards a user for logging in thrice:

```ruby
# app/easter_eggs/hattrick_observer.rb
class HattrickObserver < ActiveRecord::Observer
  observe User

  def after_save(user)
    if eligible? user
      goal.complete_for user
    end
  end

  private

  def eligible?(user)
    user.sign_in_count == 3
  end

  def goal
    Goal.hattrick
  end
end
```

Some things are more difficult to reward, though. In our example, you can't really tell whether
a user has read an article. You'll just have to trust them, and make a button that they can
click to confirm that they've read it:

```
# app/views/articles/_article.html.erb
<%= render @article %>
<%= reward current_user, for: @article %>
```

### Presenting rewards

Rewards are no good if you don't know about them, though, and so we've made a pretty sweet
helper for presenting rewards to your users when they get them. It's sort of like in Call
of Duty, except without Activision breathing down your neck and making you churn out the
same software every year.

```
# app/views/layouts/application.html.erb
<%= present_rewards for: current_user %>
```

## Configuration

Medals have images, and Gamification uses [CarrierWave](https://github.com/carrierwaveuploader/carrierwave)
to upload them. It defaults to saving images to disk, but if you'd rather save them to the
cloud you'll have to configure it:

```ruby
# config/initializers/carrierwave.rb
CarrierWave.configure do |config|
  storage :fog
end
```

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
