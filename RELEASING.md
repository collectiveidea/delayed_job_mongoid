# Releasing Delayed::Backend::Mongoid::Job

There are no particular rules about when to release delayed_job_mongoid. Release bug fixes frequently, features not so frequently and breaking API changes rarely.

### Release

Run tests, check that all tests succeed locally.

```
bundle install
bundle exec rake
```

Check that the last build succeeded in [Github Actions](https://github.com/collectiveidea/delayed_job_mongoid/actions/workflows/test.yml?query=branch%3Amaster) for all supported platforms.

Choose the version following [Semantic Versioning](https://semver.org/spec/v2.0.0.html), and set it in [delayed_job_mongoid.gemspec](delayed_job_mongoid.gemspec):

*  Increment the third number if the release only has bug fixes (eg. change `3.0.1` to `3.0.2`).
*  Increment the second number if the release adds features in a backwards compatible way (eg. change `3.0.1` to `3.1.0`).
*  Increment the first number if the release has breaking changes, including any entry marked **Breaking:** (eg. change `3.0.1` to `4.0.0`).

In [CHANGELOG.md](CHANGELOG.md), rename `## [Unreleased]` to the new version and today's date, and add a new empty `## [Unreleased]` above it:

```
## [Unreleased]

## [X.Y.Z] - YYYY-MM-DD
```

Then update the compare links at the bottom of the file, where `vPREVIOUS` is the last release's tag:

```
[Unreleased]: https://github.com/collectiveidea/delayed_job_mongoid/compare/vX.Y.Z...HEAD
[X.Y.Z]: https://github.com/collectiveidea/delayed_job_mongoid/compare/vPREVIOUS...vX.Y.Z
```

Commit your changes.

```
git add CHANGELOG.md delayed_job_mongoid.gemspec
git commit -m "Prepare for release, X.Y.Z"
```

Release.

```
$ bundle exec rake release

delayed_job_mongoid X.Y.Z built to pkg/delayed_job_mongoid-X.Y.Z.gem.
Tagged vX.Y.Z.
Pushed git commits and tags.
Pushed delayed_job_mongoid X.Y.Z to rubygems.org.
```
