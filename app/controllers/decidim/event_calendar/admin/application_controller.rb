# frozen_string_literal: true

module Decidim
  module EventCalendar
    module Admin
      class ApplicationController < Decidim::Admin::ApplicationController
        helper_method :events, :event

        def events
          @events ||= EventCalendar::ExternalEvent.where(organization: current_organization).page(params[:page]).per(15)
        end

        def event
          @event ||= events.find(params[:id])
        end

        def permission_class_chain
          [Decidim::EventCalendar::Admin::Permissions] + super
        end
      end
    end
  end
end
