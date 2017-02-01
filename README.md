[![Build Status](https://travis-ci.org/v-kolesnikov/dining_philosophers.svg?branch=master)](https://travis-ci.org/v-kolesnikov/dining_philosophers)

# Dining philosophers

[![](https://upload.wikimedia.org/wikipedia/commons/6/68/Raffael_058.jpg)](https://en.wikipedia.org/wiki/Dining_philosophers_problem)

## Problem statement
Five silent philosophers sit at a round table with bowls of spaghetti. Forks are placed between each pair of adjacent philosophers.

Each philosopher must alternately think and eat. However, a philosopher can only eat spaghetti when they have both left and right forks. Each fork can be held by only one philosopher and so a philosopher can use the fork only if it is not being used by another philosopher. After an individual philosopher finishes eating, they need to put down both forks so that the forks become available to others. A philosopher can take the fork on their right or the one on their left as they become available, but cannot start eating before getting both forks.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/v-kolesnikov/dining_philosophers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
