module Analytics
  class SearchQuery < ApplicationRecord
    self.table_name = "analytics_search_queries"

    attr_accessor :hero_search
  end
end
