### 3.0.1

* Your contribution here.
* [#89](https://github.com/collectiveidea/delayed_job_mongoid/pull/89): Add MongoSilencer plugin to silence Delayed Job polling - [johnnyshields](https://github.com/johnnyshields).
* [#88](https://github.com/collectiveidea/delayed_job_mongoid/pull/88): Extract out mixin to enable better backend customization - [johnnyshields](https://github.com/johnnyshields).

### 3.0.0

* [#81](https://github.com/collectiveidea/delayed_job_mongoid/pull/81): Drop support for Mongoid 3.0 and 4.0 - [johnnyshields](https://github.com/johnnyshields).
* [#82](https://github.com/collectiveidea/delayed_job_mongoid/pull/82): Correctly handle before_fork and after_fork hooks - [johnnyshields](https://github.com/johnnyshields).
* [#85](https://github.com/collectiveidea/delayed_job_mongoid/pull/85): Add additional indexes - [johnnyshields](https://github.com/johnnyshields).
* [#87](https://github.com/collectiveidea/delayed_job_mongoid/pull/87): Convert Travis CI to GH Actions - [johnnyshields](https://github.com/johnnyshields).

### 2.3.1 (2019/02/26)

* [#77](https://github.com/collectiveidea/delayed_job_mongoid/pull/77): Support Mongoid 7.0 - [Startouf](https://github.com/Startouf).

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
