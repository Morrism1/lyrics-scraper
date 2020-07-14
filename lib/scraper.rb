require 'nokogiri'
require 'open-uri'

class Scraper
  attr_accessor :artist, :song

  def initialize(artist, song)
    @artist = artist
    @song = song
  end

  def url_maker
    "https://www.azlyrics.com/lyrics/#{format_words(@artist)}/#{format_words(@song)}.html"
  end

  def format_words(word)
    formatted = word.gsub(/\s/, "")
    formatted.downcase
  end

  def scrape
    doc = Nokogiri::HTML(URI.open(url_maker))
    doc.css('body > div.container.main-page > div > div.col-xs-12.col-lg-8.text-center >
            div:nth-child(8)').each { |link| puts link.content }
  end
end
