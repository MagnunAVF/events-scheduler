# Events Scheduler

A events scheduler that sends alert emails.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

To help run in terminal:
```
make help
```

### Prerequisites

Before all, you need to have Ruby installed in your computer. You can use [RVM](https://rvm.io/rvm/install) or [Rbenv](https://github.com/rbenv/rbenv).
Besides this, you need to have the gem Bundler installed. To install, run in terminal:
```
gem install bundler
```

### Installing

After clone, run in terminal:
```
make setup
```

## Running the tests

Run in terminal:
```
make test
```

For automated tests in dev, run:
```
make auto-test
```

## Deployment

TODO:
* MVP => by Heroku

## Built With
* [Ruby](https://www.ruby-lang.org/)
* [RubyOnRails](http://rubyonrails.org/)
* [Rspec](http://rspec.info/)
* [Guard](https://github.com/guard/guard)
* [FactoryBot](https://github.com/thoughtbot/factory_bot_rails)
* [Faker](https://github.com/stympy/faker)
* [DatabaseCleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [SimpleCov](https://github.com/colszowka/simplecov)
* [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers)

## Contributing

Only have to fork the project and make a pull request.

## Git Style

We use something like [Karma](http://karma-runner.github.io/1.0/dev/git-commit-msg.html) for commit messages.

## Versioning

We use [SemVer](http://semver.org/) for versioning.

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).
