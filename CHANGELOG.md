### 2.3.0 (2017/02/13)

* [#72](https://github.com/collectiveidea/delayed_job_mongoid/pull/72): Fix: Unknown alias: 1 (Psych::BadAlias) when referencing an object twice from the object being serialized - [@dblock](https://github.com/dblock), [@maxjacobson](https://github.com/maxjacobson).
* [#71](https://github.com/collectiveidea/delayed_job_mongoid/pull/71): Support Mongoid 6.0 - [@dblock](https://github.com/dblock).

### 2.2.0 (2015/09/24)

* [#58](https://github.com/collectiveidea/delayed_job_mongoid/pull/58): Support Mongoid 5.0 - [@sferik](https://github.com/sferik).

### 2.1.0 (2014/05/09)

* [#38](https://github.com/collectiveidea/delayed_job_mongoid/pull/38): Fix clearing identity map before each job - [@srleo](https://github.com/srleo).
* [#43](https://github.com/collectiveidea/delayed_job_mongoid/pull/43): Compatibility with Mongoid 4.x and Delayed Job 4.x - [@dblock](https://github.com/dblock).

### 2.0.0 (2012/08/02)

* Added code coverage with SimpleCov - [@sferik](https://github.com/sferik).
* Added Mongoid 3.0 support - [@sferik](https://github.com/sferik), [@asavartsov](https://github.com/asavartsov).

### 1.0.2 (2010/01/12)

* Fix a potential memory leak inside mongo when reserving jobs on mongo 1.6+
* Fixed gemspec to work with Mongoid 2.0 RC and Rubygems 1.4

### 1.0.1 (2010/12/01)

* Use MongoDB's findAndModify to reserve the next available job in one atomic operation - [@beljun](https://github.com/beljun).
* Better index
