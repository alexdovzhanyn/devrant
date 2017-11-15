[![Gem Version](https://badge.fury.io/rb/devrant.svg)](https://badge.fury.io/rb/devrant)

# Devrant

![devRant](https://devrant.com/static/devrant/img/landing/features-avatars.png)

This gem is the unnofficial wrapper for the devRant API. It provides convinience methods and an interface to easily integrate devRant into
your ruby projects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'devrant'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devrant

## Usage

Include this gem into your project:

```ruby
require 'devrant'
```

Initialize the devRant client:

```ruby 
devRant = Devrant::Api.new
```

### Rants

**Getting all rants:**

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.rants.all
```

**Getting rant by ID:**

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.rants.get_rant(1234)
```

**Filtering Rants**

Allows you to fetch rants based on certain filters. Takes in a hash of parameters.

| Method  | Parameters      |
|:--------|:----------------|
|get_rants|limit, sort, skip|

_Parameter Values_

| Parameter      | Values    | Description                                         |
|:---------------|:----------|:----------------------------------------------------|
|limit _Optional_|any integer| Sets a maximum limit to the amount of rants returned|
|sort _Optional_ |'recent', 'algo', 'top'| Specifies order in which to sort the rants|
|skip _Optional_ |any integer| Specifies how many rants to skip. Useful for pagination|

_Example:_

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.rants.get_rants({limit: 10, sort: 'algo', skip: 5})
```

**Getting the Weekly Rants**

Find all rants that are featured weekly

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.rants.weekly
```

**Getting Story Rants**

Get rants that are categorized as a 'story'

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.rants.stories
```

**Getting Collabs**

Fetches all collabs

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.rants.collabs
```

**Searching Rants**

Search rants by a specific search term

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.rants.search('your search term here')
```

**Getting a Random Rant**

Returns a random rant with at least 15++

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.rants.random
```

**Commenting on a Rant**

Post a comment. You must authenticate before trying to post a comment.


| Method  | Parameters                                                                               |
|:--------|:-----------------------------------------------------------------------------------------|
|comment  |rant_id (int), comment_content (string), token_id (int), token_key (string), user_id (int)|

```ruby
require 'devrant'

devRant = Devrant::Api.new

auth = devRant.users.authenticate('username', 'password')

devRant.rants.comment(12345, 'This is my comment', auth.id, auth.key, auth.user_id)
```

### Users

**Getting User by ID:**

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.users.get_user(1234)
```

**Getting User ID from Username**

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.users.get_user_id('RuntimeError')
```

**Authenticating a User**

Returns an auth object with a token id, token key, and user id.

```ruby
require 'devrant'

devRant = Devrant::Api.new

devRant.users.authenticate('username', 'password')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alexdovzanyn/devrant. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Devrant project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/alexdovzhanyn/devrant/blob/master/CODE_OF_CONDUCT.md).

# Endpoints to Implement

- ~~/devrant/rants~~
- ~~/devrant/rants/:id~~
- ~~/users/get-user-id~~
- ~~/users/:id~~
- /comments
- /vote
- ~~/devrant/search~~
- ~~/devrant/weekly-rants~~
- ~~/devrant/story-rants~~
- ~~/devrant/collabs~~
- ~~/devrant/rants/surprise~~
- /users/auth-token
