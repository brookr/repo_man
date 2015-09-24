# RepoMan

Get all the repos for a GitHub user under one roof.

## Installation

Install it from the command line with:

    $ gem install repo_man

## Usage

Repo Man talks to GitHub as you, via an OAuth token. Configure your environment with a `GITHUB_TOKEN` environment variable set to a value of a [Personal Access Token](https://github.com/settings/tokens).

Use the binary from any directory that has a name matching a github user:

    $ mkdir whymirror && cd whymirror
    $ repo fetch

When you want those repos all refreshed with the latest:

    $ cd whymirror
    $ repo update

The directory name (in which the `repo` command is executed) is taken as the GitHub account name whose repos you want to manipulate.

## Contributing

1. Fork it ( https://github.com/brookr/repo_man/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
