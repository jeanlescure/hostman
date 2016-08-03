# Hostman

Hostman (host manager) is a stand-alone ruby gem that makes blocking and unblocking domains a breeze.



## Installation

Since this gem will edit the file `/etc/hosts`, in most day to day cases you'll need ti install it as root so it can be called using sudo.

Install it using sudo:

    $ sudo gem install hostman

**NOTE:** You can use several workarounds to avoid having to sudo everytime you run this, if you do, it is under your own risk.

## Usage



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jeanlescure/hostman. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

