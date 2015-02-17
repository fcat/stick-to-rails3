Stick to Rails 3
================

Gemfile having Rails has a dependency + dummy test suite that stick to Rails 3

To run the test suite:

    $ bundle exec ruby test.rb

To test the auto-update feature of Gemnasium:

    $ export GEMNASIUM_TEST_SUITE="bundle exec ruby test.rb"
    $ gemnasuim au run
