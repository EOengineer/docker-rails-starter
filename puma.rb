workers Integer(ENV['WEB_CONCURRENCY'] || 4)
threads_count = Integer(ENV['MAX_THREADS'] || 20)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
environment ENV['RAILS_ENV'] || 'development'

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}"
# Set up socket location
bind "unix:///var/run/puma.sock"

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end