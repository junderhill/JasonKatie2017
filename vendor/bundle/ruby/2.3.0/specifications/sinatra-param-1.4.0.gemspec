# -*- encoding: utf-8 -*-
# stub: sinatra-param 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sinatra-param"
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mattt Thompson"]
  s.date = "2015-04-21"
  s.description = "sinatra-param allows you to declare, validate, and transform endpoint parameters as you would in frameworks like ActiveModel or DataMapper."
  s.email = "m@mattt.me"
  s.homepage = "https://github.com/mattt/sinatra-param"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Parameter Validation & Type Coercion for Sinatra."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<sinatra>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<sinatra>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
