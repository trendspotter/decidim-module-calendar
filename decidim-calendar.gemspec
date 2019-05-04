# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/calendar/version"

Gem::Specification.new do |s|
  s.version = Decidim::Calendar.version
  s.authors = ["Mijail Rondon"]
  s.email = ["mijail@riseup.net"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/alabs/decidim-module-calendar"
  s.required_ruby_version = ">= 2.3.1"

  s.name = "decidim-calendar"
  s.summary = "A decidim calendar module"
  s.description = "Global calendar."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-admin", Decidim::Calendar.version
  s.add_dependency "decidim-consultations", Decidim::Calendar.version
  s.add_dependency "decidim-core", Decidim::Calendar.version
end