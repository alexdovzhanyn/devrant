require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "pry"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  exec 'irb -r devrant -I ./lib'
end

task :export do
  system 'rake'
  system 'gem build devrant.gemspec'
  new_gem = Dir.glob("*").max_by {|f| File.mtime(f)}
  
  system "gem push #{new_gem}"
end
