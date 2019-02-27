Releasing Delayed::Backend::Mongoid::Job
========================================

There are no particular rules about when to release delayed_job_mongoid. Release bug fixes frequently, features not so frequently and breaking API changes rarely.

### Release

Run tests, check that all tests succeed locally.

```
bundle install
rake
```

Check that the last build succeeded in [Travis CI](https://travis-ci.org/collectiveidea/delayed_job_mongoid) for all supported platforms.

Check and possibly increment the version, modify [delayed_job_mongoid.gemspec](delayed_job_mongoid.gemspec).

*  Increment the third number if the release has bug fixes and/or very minor features, only (eg. change `0.5.1` to `0.5.2`).
*  Increment the second number if the release contains major features or breaking API changes (eg. change `0.5.1` to `0.4.0`).

Change "Next" in [CHANGELOG.md](CHANGELOG.md) to the current date.

```
### 0.4.0 (2014-01-27)
```

Remove the line with "Your contribution here.", since there will be no more contributions to this release.

Commit your changes.

```
git add CHANGELOG.md delayed_job_mongoid.gemspec
git commit -m "Preparing for release, 0.4.0."
```

Release.

```
$ rake release

delayed_job_mongoid 0.4.0 built to pkg/delayed_job_mongoid-0.4.0.gem.
Tagged v0.4.0.
Pushed git commits and tags.
Pushed delayed_job_mongoid 0.4.0 to rubygems.org.
```

### Prepare for the Next Developer Iteration

Add the next release to [CHANGELOG.md](CHANGELOG.md).

```
### 0.4.1 (Next)

* Your contribution here.
```

Increment the minor version, modify [delayed_job_mongoid.gemspec](delayed_job_mongoid.gemspec).

Commit your changes.

```
git add CHANGELOG.md delayed_job_mongoid.gemspec
git commit -m "Preparing for next developer iteration, 0.4.1."
git push origin master
```
