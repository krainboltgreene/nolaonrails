require 'highline/import'

namespace :release do
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
      `rake secret`
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
