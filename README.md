TDD String calculator
===============

#### Tech stack

- Github
- Ruby [3.2.2]
- Rails [7.0.5]
- Rspec

#### Project Setup


##### 1. Check out the repository

```bash
git@github.com:tanay1298/tdd-string-calculator-kata.git
```

##### 4. Run bundle install

Run the following command in terminal to install gems.

```ruby
bundle install
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s -b 0.0.0.0 -p 3000
```

#### Tests

Run the tests using the following command:

```ruby
bundle exec rspec
```


#### Features

- Handles empty strings
- Handles single number
- Supports two numbers separated by commas
- Treats new lines between numbers as separators
- Supports custom delimiters specified at the beginning of the input string
- Throws an exception for negative numbers
- Ignores numbers bigger than 1000
- Handles delimiters of any length