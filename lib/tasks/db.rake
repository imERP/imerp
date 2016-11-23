namespace :db do
  desc "init database"
  task :init => :environment  do
    sh "rake db:create"
    sh "rake db:migrate"
    sh "rake db:seed"
  end

  desc "drop and create database"
  task :reinit => :environment  do
    sh "rake db:drop"
    Rake::Task["db:init"].invoke
  end

end
