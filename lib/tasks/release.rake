require 'highline/import'

namespace :release do
  task :new => [:drop, :setup, :assets, :add, "push:all", :finalize]
  desc "Delete the old release branch"
  task :drop do
    say "Dropping the previous release branch"
    `git branch -D #{`git branch | grep release`}`
  end

  desc "Create a new release branch"
  task :setup do
    version = ask "What version do you want to release? "
    `git flow release start #{version}`
  end

  desc "Generate the assets"
  task :assets do
    say "Precompiling the assets"
    Rake::Task["assets:precompile"].invoke
  end

  desc "Add the newly generated code to the release branch"
  task :add do
    say "Adding the assets to the repository"
    `git add . && git commit -m "Adding the compiled assets."`
  end

  namespace :push do
    task :all => [:heroku, :github]

    desc "Push the repository to Heroku"
    task :heroku do
      say "Pushing to heroku"
      `git push heroku #{`git branch | grep release`.strip!.split(' ').last}:master -f`
    end

    desc "Push the repository to Github"
    task :github do
      say "Pushing to github"
      `git push origin #{`git branch | grep release`.strip!.split(' ').last}`
    end
  end

  desc "Finalize the release run"
  task :finalize do
    say "Switching back to develop branch"
    `git checkout develop`
  end
end
