# Capistrano::bun

bun support for Capistrano 3.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bun'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-bun

## Usage

Require in `Capfile` to use the default task:

```ruby
require 'capistrano/bun'
```

The task will run before `deploy:updated` as part of Capistrano's default deploy,
or can be run in isolation with `cap production bun:install`

Configurable options:

```ruby
set :bun_target_path, -> { release_path.join('subdir') } # default not set
set :bun_flags, '--production --silent --no-progress'    # default
set :bun_roles, :all                                     # default
set :bun_env_variables, {}                               # default
set :bun_method, 'install'                               # default
```

### bun Method

As of version 5.7.0 of bun, a new install method (`ci`) was introduced which utilises
the `package-lock.json` file. Change `bun_method` to `ci` in order to use make
use of the improved installation method.

### Dependencies

bun allows for normal `dependencies` and `devDependencies`. By default this gem uses `'--production --silent --no-progress'` as the install flags which will **only** install `dependencies` and skip `devDependencies`. If you want your `devDependencies` installed as well, then remove `--production`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
