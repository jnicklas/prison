require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/prison'

Hoe.plugin :newgem
Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'prison' do
  self.developer 'Jonas Nicklas', 'jonas.nicklas@gmail.com'
  self.rubyforge_name       = self.name # TODO this is default value
  self.extra_deps         = [
    ['justinfrench-formtastic', '>= 0.2.1'],
    ['rails','>= 2.3.2']
  ]
  self.extra_dev_deps = [
    ['remarkable_rails', '>= 3.1.8'],
    ['bmabey-email_spec', '>= 0.1.3']
  ]
  self.version = Prison::VERSION
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
# task :default => [:spec, :features]
