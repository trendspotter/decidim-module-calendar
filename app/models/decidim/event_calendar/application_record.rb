# frozen_string_literal: true

module Decidim
  module EventCalendar
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
