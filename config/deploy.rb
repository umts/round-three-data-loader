# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'round-three-data-loader'
set :repo_url, 'git@github.com:umts/round-three-data-loader.git'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/srv/#{fetch :application}"

append :linked_files, "config/database.yml"
append :linked_dirs, "log"
