require 'repo_man'
require 'thor'
require 'github_api'

# Register the command-line interface options
module RepoMan
  class CLI < Thor
    class_option :pretend, type: :boolean, desc: "Don't actually make any changes"

    desc 'version', 'Displays the current gem version'
    def version
      puts RepoMan::VERSION
    end

    desc 'fetch', 'Fetches all repos into the current directory'
    def fetch
      puts "Now cloning #{repos.size} repos from #{username}..."

      repos.each do |r|
        run("git clone #{r.ssh_url}") unless Dir.exist?(r.name)
      end
    end

    desc 'update', 'Updates all existing repos in the current directory'
    def update
      puts 'Checking all current repos for updates...'

      repos.each do |r|
        run("cd #{r.name} && pwd && git pull --all") if Dir.exist?(r.name)
      end
    end

  private

    def repos
      @repos ||= github.repos.list user: username
    rescue Github::Error::Unauthorized => e
      puts "\n  Missing or incorrect auth token. Please set GITHUB_TOKEN for this env.\n\n"
      puts e.inspect
      puts
    rescue Github::Error::NotFound => e
      puts "\n  Incorrect user account. The account (#{username}) was not found.\n\n"
      puts e.inspect
      puts
    end

    def username
      @username ||= Dir.pwd.split(File::Separator).last
    end

    def github
      @github ||= Github.new(
        auto_pagination: true,
        oauth_token: ENV['GITHUB_TOKEN'])
    end

    def run(cmd)
      puts cmd
      puts `#{cmd}` unless options[:pretend]
    end
  end
end
