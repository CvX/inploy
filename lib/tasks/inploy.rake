$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
require 'inploy'

def deploy
  @deploy ||= Inploy::Deploy.new
end

begin
  require "config/deploy.rb"
rescue Exception
end


deploy.environment = ENV['environment'] || deploy.environment
deploy.skip_steps = ENV['skip_steps'].split(',') unless ENV['skip_steps'].nil?

namespace :inploy do
  namespace :local do
    desc "Local Setup"
    task :setup do
      deploy.local_setup
    end

    desc "Local Update"
    task :update do
      deploy.local_update
    end
  end

  namespace :remote do
    desc "Remote Setup"
    task :setup do
      deploy.remote_setup
    end

    desc "Remote Update"
    task :update do 
      deploy.remote_update
    end
  end

  desc "Alias to Remote Update"
  task :up => "remote:update" do
    # It's just an alias to Remote Update
  end
end
