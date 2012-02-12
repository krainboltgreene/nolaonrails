require 'highline/import'

# rake release:drop
# rake release:new
# rake assets:precompile
# rake release:add
# rake release:push:heroku
# rake release:push:github
# rake release:finalize

namespace :release do
  task :default => [:drop, :new, "assets:precompile", :add, :push, :finalize]
  desc "Delete the old release branch"
  task :drop do
    `git branch -D #{`git branch | grep release`}`
  end

  desc "Create a new release branch"
  task :new do
    version = ask "What version do you want to release? "
    `git flow release start #{version}`
  end

  namespace :generate do
    desc "Generate a new secret token"
    task :token do
      open 'config/initializers/secret_token.rb', 'w' do |file|
        new_secret = `rake secret`
        secret_file = File.read file.path
        secret_file.sub
      end
    end

    desc "Generate the configurations files"
    task :configurations do
      files = Dir["*/*.example"]
      files.each { |f| `cp #{f} #{f.sub('.example', '')}` }
    end

    desc "Generate the assets"
    task :assets => "precompile:assets"
  end
end
