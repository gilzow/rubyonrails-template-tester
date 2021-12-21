# -*- encoding: utf-8 -*-
# stub: platform_sh_rails 0.1.12 ruby lib

Gem::Specification.new do |s|
  s.name = "platform_sh_rails".freeze
  s.version = "0.1.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ori Pekelman".freeze]
  s.date = "2019-11-20"
  s.description = "Platform.sh rails helper gem to ease interacting with the environment".freeze
  s.email = ["ori@platform.sh".freeze]
  s.homepage = "https://platform.sh".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Platform.sh rails helper gem to ease interacting with the environment".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<platform_sh>.freeze, ["= 0.2.11"])
    s.add_runtime_dependency(%q<activerecord-nulldb-adapter>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.12"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  else
    s.add_dependency(%q<platform_sh>.freeze, ["= 0.2.11"])
    s.add_dependency(%q<activerecord-nulldb-adapter>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
