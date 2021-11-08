# frozen_string_literal: true

base_path = File.expand_path("..", __dir__)

Decidim::Webpacker.register_path("#{base_path}/app/packs")

Decidim::Webpacker.register_entrypoints(
  decidim_calendar: "#{base_path}/app/packs/entrypoints/decidim_calendar.js",
  decidim_calendar_gantt: "#{base_path}/app/packs/entrypoints/decidim_calendar_gantt.js"
)

Decidim::Webpacker.register_stylesheet_import("stylesheets/decidim/calendar/calendar")
