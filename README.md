# README
### Babysitter Calculator (Terminal Version)
Developed by Brandon Niles

Built with Ruby 2.3.3 & RSpec 3.7.0


The babysitter:

- starts no earlier than 5:00PM
- leaves no later than 4:00AM
- gets paid $12/hour from start-time to bedtime
- gets paid $8/hour from bedtime to midnight
- gets paid $16/hour from midnight to end of job
- gets paid for full hours (no fractional hours)

The babysitter will clock in.         (Enter her start time)
The babysitter will then clock out.   (Enter her leave time)
The app will then calculator the amount she will charge the customer based on the rules above.
This app runs completely from terminal or the command prompt.

**NOTE: This app _only_ accepts Military Time format.**
The app will give you examples when necessary.
Visit http://www.spacearchive.info/military.htm for more info

## Dependencies

##### RSpec
Tests are run with RSpec. Depending on the version of ruby, you may need to run
`gem install rspec` first before running tests.

##### Rake
Depending on the version of ruby, you may need to run
run `gem install rake`

## To run the program:

From the main project directory (bn_babysitter_terminal), run `rake run`

## To run tests:

Tests are run with RSpec.

From the main project directory (bn_babysitter_terminal),
Type `rspec` to run all tests at once.

For a better read out of each test add the flag `--format documentation`
so it reads: `rspec --format documentation`

For more specific results, testing of individual methods is allowed.
First run `cd spec` to move into the spec directory for individual method testing.
Add any of the following filenames after `rspec`:

* `before_bedtime_spec.rb` - to test wages earned before bedtime
* `bedtime_spec.rb` - to test wages earned between bedtime and midnight
* `post_midnight_spec.rb` - to test wages earned between midnight and 4am
* `total_wages_spec.rb` - to test the total wages earned for a given shift
* `timestamp_spec.rb` - to test timestamps for being between 5pm and 4am

For example:
`rspec bedtime_spec.rb --format documentation` would be run from inside of the spec directory to test for the wages earned between bedtime and midnight.

Developer potentially has more dynamic versions to follow.
Developer also has other ideas on how to solve this kata and willing to discuss.
