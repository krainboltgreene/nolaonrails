require 'highline/import'

# rake release:drop
# rake release:new
# rake release:assets
# rake release:add         => git add . && git commit -m "Adding the compiled assets."
# rake release:push:heroku => git push heroku release/1.5.0:master -f
# rake release:push:github => git push origin release/1.5.0
# rake release:finalize    => git checkout develop

namespace :release do
  task :new => [:drop, :setup, :assets, :add, "push:all", :finalize]
  desc "Delete the old release branch"
  task :drop do
    `git branch -D #{`git branch | grep release`}`
  end

  desc "Create a new release branch"
  task :setup do
    version = ask "What version do you want to release? "
    `git flow release start #{version}`
  end

  desc "Generate the assets"
  task :assets do
    Rake::Task["assets:precompile"].invoke
  end

  desc "Add the newly generated code to the release branch"
  task :add do
    `git add . && git commit -m "Adding the compiled assets."`
  end

  namespace :push do
    task :all => [:heroku, :github]

    desc "Push the repository to Heroku"
    task :heroku do
      `git push heroku #{`git branch | grep release`.strip!}:master -f`
    end

    desc "Push the repository to Github"
    task :github do
      `git push origin #{`git branch | grep release`.strip!}`
    end
  end

  desc "Finalize the release run"
  task :finalize do
    `git checkout develop`
  end
end
