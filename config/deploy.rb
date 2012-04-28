#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
require "bundler/capistrano"

set :application, "zuykov"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, true
set :user, "ram"

set :rvm_ruby_string, '1.9.2@zuykov'
set :rvm_type, :system

set :scm, "git"
set :repository,  "git@ram.unfuddle.com:ram/zuykov.git"
set :branch, "master"

role :web, "zuykov.movister.ru"                          # Your HTTP server, Apache/etc
role :app, "zuykov.movister.ru"                          # This may be the same as your `Web` server
role :db,  "zuykov.movister.ru", :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true

after "bundle:install", "deploy:migrate"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do
    run "#{try_sudo} sudo /etc/init.d/nginx start"
  end
  task :stop do
    run "#{try_sudo} sudo /etc/init.d/nginx stop"
   end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} sudo /etc/init.d/nginx restart"
  end
end