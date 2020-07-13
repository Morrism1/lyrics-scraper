# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize(artist, song)
    @artist = artist
    @song = song
    @url = url
  end

  def scrape
    doc = Nokogiri::HTML(URI.open(url_maker(@artist, @song)))
    doc.css('body > div.container.main-page > div > div.col-xs-12.col-lg-8.text-center >
            div:nth-child(8)').each { |link| puts link.content }
  end

  def url_maker(artist, song)
    "https://www.azlyrics.com/lyrics/#{format_words(artist)}/#{format_words(song)}.html"
  end

  def format_words(word)
    formatted= word.gsub(' ','')
    formatted.downcase
  end
end
