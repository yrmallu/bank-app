# -*- encoding: utf-8 -*-
# stub: sneaky-save 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "sneaky-save".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sergei Zinin (einzige)".freeze]
  s.date = "2016-08-06"
  s.description = "ActiveRecord extension. Allows to save record without calling callbacks and validations.".freeze
  s.email = "szinin@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://github.com/einzige/sneaky-save".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Allows to save record without calling callbacks and validations.".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.2.0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 3.2.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
