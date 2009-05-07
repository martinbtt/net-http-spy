# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nethttp-spy}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin Sadler"]
  s.date = %q{2009-05-07}
  s.email = %q{martin@beyondthetype.com}
  s.extra_rdoc_files = ["readme.markdown"]
  s.files = ["readme.markdown", "spy.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/spy_spec.rb", "lib/spy.rb", "examples/fogbugz.rb", "examples/google.rb", "examples/twitter-calltrace.rb", "examples/twitter-customlog.rb", "examples/twitter-simple.rb", "examples/twitter-verbose.rb", "examples/twitter-withbody.rb"]
  s.homepage = %q{http://beyondthetype.com}
  s.rdoc_options = ["--main", "readme.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{nethttp-spy}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Ever wondered what HTTP requests the Ruby gem you are using to connect to a third party API is making? Use HTTP Spy to see what is going on behind the scenes.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<twitter>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<twitter>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<twitter>, [">= 0"])
  end
end
