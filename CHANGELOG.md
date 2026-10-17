# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/2.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `MongoSilencer` plugin to silence Delayed Job polling. ([#89], [@johnnyshields])
- Support for Mongoid 8 and 9.
- Support for Ruby 3.4 and 4.0.

### Changed

- Extract the backend into a mixin to enable better backend customization. ([#88], [@johnnyshields])
- Optimize the job reservation query by combining two `$or` branches into one. ([#90], [@johnnyshields])

### Removed

- **Breaking:** Support for Ruby versions older than 3.2.
- **Breaking:** Support for Mongoid versions older than 7.
- Support for the Syck YAML parser.

## [3.0.0] - 2021-09-20

### Changed

- Add additional indexes. ([#85], [@johnnyshields])
- Convert Travis CI to GitHub Actions. ([#87], [@johnnyshields])

### Removed

- **Breaking:** Support for Mongoid 3.0 and 4.0. ([#81], [@johnnyshields])

### Fixed

- Correctly handle `before_fork` and `after_fork` hooks. ([#82], [@johnnyshields])

## [2.3.1] - 2019-02-27

### Added

- Support for Mongoid 7.0. ([#77], [@Startouf])

## [2.3.0] - 2017-02-13

### Added

- Support for Mongoid 6.0. ([#71], [@dblock])

### Fixed

- Unknown alias: 1 (`Psych::BadAlias`) when referencing an object twice from the object being serialized. ([#72], [@dblock], [@maxjacobson])

## [2.2.0] - 2015-09-24

### Added

- Support for Mongoid 5.0. ([#58], [@sferik])

## [2.1.0] - 2014-05-09

### Added

- Compatibility with Mongoid 4.x and Delayed Job 4.x. ([#43], [@dblock])

### Fixed

- Fix clearing identity map before each job. ([#38], [@srleo])

## [2.0.0] - 2012-08-02

### Added

- Mongoid 3.0 support. ([@sferik], [@asavartsov])

### Changed

- Add code coverage with SimpleCov. ([@sferik])

## [1.0.2] - 2011-01-12

### Fixed

- Fix a potential memory leak inside mongo when reserving jobs on mongo 1.6+.
- Fix gemspec to work with Mongoid 2.0 RC and RubyGems 1.4.

## [1.0.1] - 2010-12-01

### Changed

- Use MongoDB's findAndModify to reserve the next available job in one atomic operation. ([@beljun])
- Better index.

[Unreleased]: https://github.com/collectiveidea/delayed_job_mongoid/compare/79bd6948c95b75df42e727c41fe66ac393f01a65...HEAD
[3.0.0]: https://github.com/collectiveidea/delayed_job_mongoid/compare/v2.3.1...79bd6948c95b75df42e727c41fe66ac393f01a65
[2.3.1]: https://github.com/collectiveidea/delayed_job_mongoid/compare/v2.3.0...v2.3.1
[2.3.0]: https://github.com/collectiveidea/delayed_job_mongoid/compare/v2.2.0...v2.3.0
[2.2.0]: https://github.com/collectiveidea/delayed_job_mongoid/compare/v2.1.0...v2.2.0
[2.1.0]: https://github.com/collectiveidea/delayed_job_mongoid/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/collectiveidea/delayed_job_mongoid/compare/v1.1.0...v2.0.0
[1.0.2]: https://github.com/collectiveidea/delayed_job_mongoid/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/collectiveidea/delayed_job_mongoid/compare/v1.0.0...v1.0.1

[#38]: https://github.com/collectiveidea/delayed_job_mongoid/pull/38
[#43]: https://github.com/collectiveidea/delayed_job_mongoid/pull/43
[#58]: https://github.com/collectiveidea/delayed_job_mongoid/pull/58
[#71]: https://github.com/collectiveidea/delayed_job_mongoid/pull/71
[#72]: https://github.com/collectiveidea/delayed_job_mongoid/pull/72
[#77]: https://github.com/collectiveidea/delayed_job_mongoid/pull/77
[#81]: https://github.com/collectiveidea/delayed_job_mongoid/pull/81
[#82]: https://github.com/collectiveidea/delayed_job_mongoid/pull/82
[#85]: https://github.com/collectiveidea/delayed_job_mongoid/pull/85
[#87]: https://github.com/collectiveidea/delayed_job_mongoid/pull/87
[#88]: https://github.com/collectiveidea/delayed_job_mongoid/pull/88
[#89]: https://github.com/collectiveidea/delayed_job_mongoid/pull/89
[#90]: https://github.com/collectiveidea/delayed_job_mongoid/pull/90

[@asavartsov]: https://github.com/asavartsov
[@beljun]: https://github.com/beljun
[@dblock]: https://github.com/dblock
[@johnnyshields]: https://github.com/johnnyshields
[@maxjacobson]: https://github.com/maxjacobson
[@sferik]: https://github.com/sferik
[@srleo]: https://github.com/srleo
[@Startouf]: https://github.com/Startouf
