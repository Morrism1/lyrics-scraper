require_relative 'spec_helper.rb'
require_relative '../lib/scraper.rb'

require 'nokogiri'

RSpec.describe Scraper do
  let(:artist) { 'Kanye West' }
  let(:song) { 'Through the wire' }
  let(:my_scraper) { Scraper.new(artist, song) }
  let(:doc) { Nokogiri::HTML(URI.open('https://www.azlyrics.com/lyrics/imaginedragons/believer.html')) }

  describe 'Initialize' do
    it 'returns true if scraper is subclass of Scraper' do
      expect(my_scraper).to be_an_instance_of(Scraper)
    end
    it 'set artist as first argument of initialize' do
      expect(my_scraper.artist).to eq(artist)
    end
    it 'set song as second argument of initialize' do
      expect(my_scraper.song).to eql(song)
    end
  end

  describe '#format_words' do
    it 'returns a string without spaces and lowercased' do
      expect(my_scraper.send(:format_words, artist)).to eql('kanyewest')
    end
    it 'returns false to a string without spaces and lowercased' do
      expect(my_scraper.send(:format_words, artist)).not_to eql('kanye west')
    end
  end

  describe '#url_maker' do
    it 'returns full made url for scraper' do
      expect(my_scraper.send(:url_maker)).to eql('https://www.azlyrics.com/lyrics/kanyewest/throughthewire.html')
    end
    it 'returns false for defective url for scraper' do
      expect(my_scraper.send(:url_maker)).not_to eql('https://www.azlyrics.com/lyrics/kanye west/through thewi re.html')
    end
  end

  describe '#scrape' do
    it 'returns a string from a page scraped' do
      expect(my_scraper.send(:scrape).class).to eql(String)
    end
  end

  describe '#error_handle' do
    it 'returns a class of Tempfile from url maker method' do
      expect(my_scraper.send(:error_handle,
                             'https://www.azlyrics.com/lyrics/kanyewest/throughthewire.html').class).to eql(Tempfile)
    end
    it 'returns Not found if lyrics does not exist' do
      expect(my_scraper.send(:error_handle, 'https://www.azlyrics.com/lyrics/kado/kado.html')).to eql('Not found')
    end
  end

  describe '#scraper' do
    let(:artist) { 'kado' }
    let(:song) { 'kado' }
    it 'returns an error message of not found' do
      expect(my_scraper.scraper).to eql("Didn't Find the Lyrics of 'kado' by 'kado' ")
    end
  end

  describe '#scraper' do
    it 'returns the lyrics in form of a string' do
      expect(my_scraper.scraper.class).to eql(String)
    end
  end
end
