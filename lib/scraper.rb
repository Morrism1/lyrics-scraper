require 'nokogiri'
require 'open-uri'

class Scraper
  attr_reader :artist, :song

  def initialize(artist, song)
    @artist = artist
    @song = song
  end

  def scraper
    if error_handle(url_maker) == 'Not found'
      "Didn't Find the Lyrics of '#{@song}' by '#{@artist}' "
    else
      scrape
    end
  end

  private

  def scrape
    lyrics = ''
    doc = Nokogiri::HTML(error_handle(url_maker))
    doc.css('body > div.container.main-page > div > div.col-xs-12.col-lg-8.text-center >
            div:nth-child(8),
            body > div.container.main-page > div > div.col-xs-12.col-lg-8.text-center >
            div:nth-child(10)').map { |link| lyrics << link.content }
    lyrics
  end

  def error_handle(url)
    begin
      page = URI.open(url)
    rescue OpenURI::HTTPError => e
      page = 'Not found' if e.message == '404 Not Found'
    end
    page
  end

  def url_maker
    "https://www.azlyrics.com/lyrics/#{format_words(@artist)}/#{format_words(@song)}.html"
  end

  def format_words(word)
    formatted = word.gsub(/\s/, '')
    formatted.downcase
  end
end
