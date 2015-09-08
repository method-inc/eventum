# Contributing

Contributions are always welcome! Bug reports and pull requests can be submitted
on GitHub under the [Eventum repo][repo]. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [code of conduct][conduct]. Please follow the guidelines below when
contributing to Eventum.

## Reporting Issues

* Make sure the issue has not already been reported.
* Check that the issue has not already been fixed in `master`.
* Open a [new issue][newissue] with a clear and concise description of the
  problem.
* Include any relevant code or error output in the issue summary.

## Development

**Fork** the repo and clone it locally, then install dependencies by running:

    $ bin/setup

Run the test suite to make sure everything is passing:

    $ bundle exec rspec

You can start a Pry session by running:

    $ bin/console

To install this gem onto your local machine run:

    $ bundle exec rake install

## Pull Request

* Create a new branch for your feature/bug.
* Get coding!
* Write good tests. See [Testing][testing].
* Follow the same coding conventions as the rest of the project. See [Coding
  Style][codingstyle].
* Squash related commits when needed and write good commit messages.
* Add an entry to the [Changelog][changelog] accordingly. See [Changelog Entries]
  [changelogentries].
* Make sure the test suite is passing and that there are no style violations
  before pushing your code.
* Pull requests should be related to a single subject.
* Open a pull request until you are happy with your contribution and it's ready
  for review.

### Testing

Always include tests with you code. Eventum uses [RSpec][rspec] for testing. We
like to follow the recommendations listed in [Better Specs][betterspecs].

Run the entire test suite:

    $ bundle exec rspec

Or run specific files/directories:

    $ bundle exec rspec spec/lib/eventum_spec.rb

Alternatively, the `Gemfile` includes [Guard][guard], a file watcher that will
automatically run `rspec` when a file is saved. This is not a requirement but we
encourage running `bundle exec guard` before starting development so that you
are able to catch failed tests as you code away :-).

### Coding Style

Eventum leverages [Hound][hound] to maintain the code style consistent across
the gem. Hound uses [rubocop][rubocop], which you can run locally.

Run for the entire codebase:

    $ bundle exec rubocop

Or run for specific files/directories:

    $ bundle exec rubocop lib/eventum.rb

Just like with tests, `guard` will automatically run `rubocop` when a file is
saved (unless a test fails). Once again, we would like to encourage running
`bundle exec guard` before starting development.

Hound will comment on pull requests with style violations, and pull requests
won't be merged until violations are corrected.

### Changelog Entries

* Use [Markdown syntax][markdown].
* The entry line should start with a bullet point `*`.
* If the change has a related GitHub issue, include a link to it.
* Provide a brief summary of the change.
* At the end of the entry, add an implicit link to your GitHub user page as
  `([@username][])`.
* If this is your first contribution, add a link definition for the implicit
  link to the bottom of the changelog as `[@username]:
  https://github.com/username`.
* Check the [Changelog][changelog] for examples of good entries.

---

<p align="center">
  <img src="logos/skookum_mark_black.png" alt="Skookum" width="100" />
</p>

[repo]: https://github.com/Skookum/eventum
[conduct]: CODE_OF_CONDUCT.md
[newissue]: https://github.com/Skookum/eventum/issues/new
[testing]: #testing
[codingstyle]: #coding-style
[changelog]: CHANGELOG.md
[changelogentries]: #changelog-entries
[rspec]: https://github.com/rspec/rspec
[betterspecs]: http://betterspecs.org
[guard]: https://github.com/guard/guard
[hound]: https://houndci.com
[rubocop]: https://github.com/bbatsov/rubocop
[markdown]: http://daringfireball.net/projects/markdown/syntax
