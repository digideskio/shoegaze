$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require "shoegaze/version"

Gem::Specification.new do |s|
  s.name        = "shoegaze"
  s.version     = Shoegaze::VERSION
  s.authors     = ["Dan Connor"]
  s.email       = ["dan@compose.io"]
  s.homepage    = "https://github.com/compose/shoegaze"
  s.summary     = "Create mocks of modules (especially clients) with easily-defined scenarios (success, invalid, etc)"
  s.description = ""
  s.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  s.add_dependency "rspec"
  s.add_dependency "factory_girl"
  s.add_dependency "topmodel"
  s.add_dependency "representable"
  s.add_dependency "multi_json"
end
