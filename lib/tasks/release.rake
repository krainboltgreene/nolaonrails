if Rails.env.development?
  require 'highline/import'
end

namespace :release do
  task :new => [:drop, :setup, :assets, :add, "push:github", :stripe, "push:heroku", :finalize]
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

  desc "Setup the Stripe live key"
  task :stripe do
    `git rm config/initializers/stripe.rb`
    public_key = ask "What is the Stripe Public Key? "
    private_key = ask "What is the Stripe Private Key? "
    open 'config/initializers/stripe.rb', 'w' do |file|
      file.write %{ Stripe.api_key = "#{private_key}" \n STRIPE_PUBLIC_KEY = "#{public_key}" }
    end
    `git add -f config/initializers/stripe.rb && git commit -am "Adding the real stripe keys"`
  end

  namespace :push do
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
