# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'chat-space'
set :repo_url, 'git@github.com:yyuto6012/chat-space.git'

set :deploy_to, 'var/www/chat-space'

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/yyuto6012.pem']

set :linked_files, fetch(:linked_files, []).push('config/settings.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

set :default_env, {
  rbenv_root: "/usr/local/bin/rbenv",
  path: "~/.rbenv/shims:~/.rbenv/bin:$PATH",
  AWS_REGION: ENV['AWS_REGION'],
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"]
}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

end
