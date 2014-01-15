Love is...
=======

... a Markov chains generator. Now you can define what is love.

[![Code Climate](https://codeclimate.com/repos/52d65a6ae30ba005c70052ce/badges/5c4d87b7a359b9db5767/gpa.png)](https://codeclimate.com/repos/52d65a6ae30ba005c70052ce/feed)

A Markov chain?
-----------
A Markov chain (discrete-time Markov chain or DTMC) named after Andrey Markov, is a mathematical system that undergoes transitions from one state to another, among a finite or countable number of possible states. (c) [Wikipedia](http://en.wikipedia.org/wiki/Markov_chain)

Installation
------------
```
  gem install love_is
```

Usage
------------
```
  require 'love_is'

  generator = LoveIs::Generator.new.parse_file('data')
  puts generator.generate
  # => Love is sitting pretty.
  
  # Change depth of tree.
  generator = LoveIs::Generator.new(5).parse_file('data')
  # Generate just 4 words.
  puts generator.generate(4)
  # => Love is wishing the
  
  # Put tree to yaml.
  generator.data_to_yaml('data_in_yaml')
  # Get tree from yaml.
  generator.data_from_yaml('data_in_yaml')
```

Contributing
------------
1. Fork it;
2. Create your feature branch (`git checkout -b my-new-feature`);
3. Commit your changes (`git commit -am 'Added some feature'`);
4. Push to the branch (`git push origin my-new-feature`);
5. Create new Pull Request.

Copyright
---------
Copyright (c) 2013 Sergey Smagin. See LICENSE for details.
