# frozen_string_literal: true

module Decidim
  module EventCalendar
    module CalendarHelper
      include Decidim::ApplicationHelper
      include Decidim::TranslationsHelper
      include Decidim::ResourceHelper
      def calendar_resource(name)
        %({
          "id": "#{name}",
          "title": "#{I18n.t(name, scope: "decidim.calendar.index.filters")}"
        })
      end

      def render_events(events)
        events.collect { |event| calendar_event(event) }.to_json
      end

      def calendar_event(event)
        {
          title: translated_attribute(event.full_title),
          start: (event.start.strftime("%FT%R") unless event.start.nil?),
          end: finish_date(event),
          color: event.color,
          url: event.link,
          resourceId: event.type,
          allDay: event.all_day?,
          subtitle: (translated_attribute(event.subtitle) unless event.subtitle.empty?)
        }.compact
      end

      def participatory_gantt(event)
        %({
          "id": "#{event.full_id}",
          "name": "#{translated_attribute event.full_title} - #{translated_attribute event.subtitle}",
          "start": "#{event.start.strftime("%FT%R")}",
          "dependencies": "#{event.parent}",
          "end": "#{event.finish.strftime("%FT%R")}",
          "progress": #{progress_gantt(event)}
        })
      end

      private

      def finish_date(event)
        finish = event.finish

        return if finish.nil?

        finish = finish + 1.day if event.all_day?

        finish.strftime("%FT%R")
      end

      def progress_gantt(event)
        today = Date.today
        start_date = event.start_date
        end_date = event.end_date

        return 0 if today < start_date

        return 90 if today == end_date

        return 100 if today > end_date

        total_days = (end_date - start_date).to_i
        days_performed = (today - start_date).to_i
        (days_performed * 100) / total_days
      end
    end
  end
end
