require "rvm/capistrano"
require "bundler/capistrano"

ssh_options[:forward_agent] = true

set :rvm_ruby_string,               '1.9.3'
set :rvm_type,                      :user # this is the money config, it defaults to :system

set :bundle_without,                [:development, :test]

set :application,                   "r12-team-176"
set :user,                          "deploy"
set :use_sudo,                      false
set :repository,                    "git@github.com:railsrumble/#{application}.git"
set :deploy_via,                    :remote_cache

set :scm,                           :git
set :branch,                        "master"
set :migrate_target,                :current
set :rails_env,                     "production"
set :normalize_asset_timestamps,    false

set :deploy_to,                     "/home/#{user}/#{application}"

server "50.56.173.25", :web, :app, :db, primary: true

default_environment["RAILS_ENV"] = 'production'

namespace :deploy do
  desc "Zero-downtime restart of Unicorn"
  task :restart, :except => { :no_release => true } do
    run "kill -s USR2 `cat /tmp/unicorn.allocit.pid`"
  end

  desc "Start unicorn"
  task :start, :except => { :no_release => true } do
    run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D"
  end

  desc "Stop unicorn"
  task :stop, :except => { :no_release => true } do
    run "kill -s QUIT `cat /tmp/unicorn.allocit.pid`"
  end
end

def run_rake(cmd)
  run "cd #{current_path}; #{rake} #{cmd}"
end
