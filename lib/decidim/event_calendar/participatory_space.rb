# frozen_string_literal: true

require_dependency "decidim/components/namer"

Decidim.register_participatory_space(:calendar) do |participatory_space|
  participatory_space.icon = "decidim/calendar/icon.svg"
  participatory_space.stylesheet = "decidim/calendar/calendar"
  participatory_space.model_class_name = "Decidim::EventCalendar"

  participatory_space.participatory_spaces do |organization|
    Decidim::EventCalendar::OrganizationCalendar.new(organization).query
  end

  participatory_space.context(:public) do |context|
    context.engine = Decidim::EventCalendar::Engine
  end

  participatory_space.context(:admin) do |context|
    context.engine = Decidim::EventCalendar::AdminEngine
  end
end
