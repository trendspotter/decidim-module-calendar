# frozen_string_literal: true

class RenameDecidimCalendarExternalEventsToDecidimEventCalendarExternalEvents < ActiveRecord::Migration[5.2]
  def change
    rename_table :decidim_calendar_external_events, :decidim_event_calendar_external_events
  end
end
