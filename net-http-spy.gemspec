# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{net-http-spy}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin Sadler"]
  s.date = %q{2009-05-07}
  s.email = %q{martin@beyondthetype.com}
  s.homepage = %q{http://github.com/martinbtt/net-http-spy}
  s.extra_rdoc_files = ["readme.markdown"]
  s.files = Dir['lib/**/*.rb'] + Dir['[A-Z]*']  + Dir['spec/*'] + Dir['examples/*.rb']  + ["readme.markdown"]
  s.rdoc_options = ["--main", "readme.markdown"]
  s.require_paths = ["lib"]
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
