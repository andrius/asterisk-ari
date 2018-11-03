require "bundler/gem_tasks"
require 'open-uri'
require 'json'
require 'ari/generators/resource_generator'
require "rake/testtask"

task :default => :test

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

desc "Generate resources from JSON specification"
task :generate do

  base_url = ENV.fetch('ARI_URL', 'http://svn.asterisk.org/svn/asterisk/trunk/rest-api/api-docs')
  base_url = "#{base_url}/%{resource_name}.json"
  username = ENV['ARI_USERNAME']
  password = ENV['ARI_PASSWORD']
  resources = %w{ applications asterisk bridges channels deviceStates endpoints
    events mailboxes playbacks recordings sounds
  }

  resource_options = {
    asterisk: {
      resource_klass_name: 'AsteriskInfo'
    },
    applications: {
      id_attribute_name: 'applicationName'
    },
    events: {
      only_models: true
    }
  }

  models_path = File.join(__dir__, 'lib', 'ari', 'models.rb')
  FileUtils.rm_f models_path
  models_file = File.new(models_path, 'a')

  resources_path = File.join(__dir__, 'lib', 'ari', 'resources.rb')
  FileUtils.rm_f resources_path
  resources_file = File.new(resources_path, 'a')

  resources.each do |resource_name|
    url = base_url % { resource_name: resource_name }
    puts ">> generating #{resource_name} from #{url}"
    data = if username && password
             open(url, http_basic_authentication: [username, password])
           else
             open(url)
           end
    json = JSON.parse(data.read)
    generator = Ari::Generators::ResourceGenerator.new(
      resource_name,
      json,
      resource_options[resource_name.to_sym] || {}
    )
    generator.generate

    resources_file.puts "require 'ari/resources/#{generator.resource_name}'"
    generator.models.each do |model|
      next if model.name == generator.resource_name
      models_file.puts "require 'ari/models/#{model.name}'"
    end
  end

  models_file.close

end
