require "rubygems"
require "rake/gempackagetask"
require "rake/rdoctask"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "net-http-spy"
    gemspec.summary = "Ever wondered what HTTP requests the Ruby gem you are using to connect to a third party API is making? Use HTTP Spy to see what is going on behind the scenes."
    gemspec.email = "martin@beyondthetype.com"
    gemspec.homepage = "http://github.com/martinbtt/net-http-spy"
    gemspec.description = "Ever wondered what HTTP requests the Ruby gem you are using to connect to a third party API is making? Use HTTP Spy to see what is going on behind the scenes."
    gemspec.authors = ["Martin Sadler"]
    gemspec.files.include Dir["examples/*.rb"] + ["readme.markdown"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

task :default => :spec

require "spec"
require "spec/rake/spectask"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = %w(--format specdoc --colour)
  t.libs = ["spec"]
end


# Generate documentation
Rake::RDocTask.new do |rd|
  rd.main = "readme.markdown"
  rd.rdoc_files.include("readme.markdown", "lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end
