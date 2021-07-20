#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'open-uri/cached'
require 'pry'

class MemberList
  # details for an individual member
  class Member < Scraped::HTML
    field :name do
      noko.css('a').text.tidy.gsub(/^Rt Hon /, '').gsub(/ MS$/, '')
    end

    field :positions do
      noko.css('.subtitle').text.tidy.split(', and ')
    end
  end

  # The page listing all the members
  class Members < Scraped::HTML
    # Generate separate entries for combinations such as
    # "Deputy Minister for Arts and Sport, and Chief Whip"
    field :members do
      member_container.flat_map do |member|
        data = fragment(member => Member).to_h
        data.delete(:positions).map { |posn| data.merge(position: posn) }
      end
    end

    private

    def member_container
      noko.css('.ministers-ministers .cta_key')
    end
  end
end

url = 'https://gov.wales/cabinet-members-and-ministers'
# with a User-Agent the request gets rejected
puts EveryPoliticianScraper::ScraperData.new(url, headers: { 'User-Agent' => 'wales-cabinet' }).csv
