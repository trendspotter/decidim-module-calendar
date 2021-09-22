# frozen_string_literal: true

module Decidim
  module EventCalendar
    class OrganizationCalendar < Rectify::Query
      def initialize(organization)
        @organization = organization
      end

      def query
        Decidim::Assembly.where(organization: @organization)
      end
    end
  end
end
