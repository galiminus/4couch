# encoding: utf-8
set :application, "4couch.phorque.dyndns.info"
server "#{user}@#{application}", :app, :web, :db, :primary => true

set :deploy_via, :remote_cache
set :branch, "master"

set :rails_env, "production"
