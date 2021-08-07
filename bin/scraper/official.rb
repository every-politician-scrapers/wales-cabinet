#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      Name.new(
        full:     noko.css('a').text,
        prefixes: %w[Rt Hon],
        suffixes: %w[MS]
      ).short
    end

    def position
      noko.css('.subtitle').text.tidy.split(', and ')
    end
  end

  class Members
    def member_container
      noko.css('.ministers-ministers .cta_key')
    end
  end
end

file = Pathname.new 'html/official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
