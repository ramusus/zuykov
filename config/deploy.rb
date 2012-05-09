#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
require 'bundler/capistrano'
require 'capistrano/deepmodules'

set :application, "zuykov"
set :deploy_to, "/data/www/zuykov.ru"
set :deploy_via, :remote_cache
set :use_sudo, true
set :user, "www"

set :rvm_ruby_string, "1.9.2"
set :rvm_type, :user

set :scm, "git"
set :repository,  "git@ram.unfuddle.com:ram/#{application}.git"
set :branch, "master"

role :web, "lectures.dev.infolio.ru"                          # Your HTTP server, Apache/etc
role :app, "lectures.dev.infolio.ru"                          # This may be the same as your `Web` server
role :db,  "lectures.dev.infolio.ru", :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true

after "bundle:install", "deploy:auto_migrate"

namespace :deploy do
  task :start do
    run "cd #{deploy_to}/current && ./server start"
  end
  task :stop do
    run "cd #{deploy_to}/current && ./server stop"
   end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{deploy_to}/current && ./server restart"
  end
  task :auto_migrate do
    rake = fetch(:rake, "rake")
    rails_env = fetch(:rails_env, "production")
    run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} db:auto:migrate"
  end
  task :load_db do
    rake = fetch(:rake, "rake")
    rails_env = fetch(:rails_env, "production")
    run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} db:load"
  end
end