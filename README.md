Love is...
=======

... a Markov chains generator. Now you can define what is love.

A Markov chain?
-----------
A Markov chain (discrete-time Markov chain or DTMC) named after Andrey Markov, is a mathematical system that undergoes transitions from one state to another, among a finite or countable number of possible states. (c) [Wikipedia](http://en.wikipedia.org/wiki/Markov_chain)

How to use it
------------
```
  generator = LoveIs::Generator.new.parse_file('data')
  puts generator.generate
  #=> Love is sitting pretty.
```
