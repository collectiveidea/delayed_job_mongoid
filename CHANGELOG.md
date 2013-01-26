1.0.2 - 2010-01-12
==================
* Fix a potential memory leak inside mongo when reserving jobs on mongo 1.6+
* Fixed gemspec to work with Mongoid 2.0 RC and Rubygems 1.4

1.0.1 - 2010-12-01
==================
* Use MongoDB's findAndModify to reserve the next available job in one atomic operation
* Better index
