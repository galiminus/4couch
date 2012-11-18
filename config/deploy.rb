require 'capistrano-helpers/specs'

require "bundler/capistrano"

set :rvm_ruby_string, '1.9.3@four_couch'

require "rvm/capistrano"

set :use_sudo, false
set :appname, 'four_couch'
set :user, "four_couch"

require 'capistrano/af83'
load "af83/info"

set :repository, "git://github.com/phorque/4couch.git"
set :scm, "git"

set :deploy_to, "/home/four_couch/"
ssh_options[:port] = 2003

set :public_children, %w(images)

load "af83/thin"
load "deploy/assets"

after "deploy", "deploy:migrate"
