require_relative 'spec_helper.rb'
require '../lib/scraper.rb'

require 'nokogiri'

RSpec.describe Scraper do
  let(:artist) { 'Kanye West' }
  let(:song) { 'Through the wire' }
  let(:scraper) { Scraper.new(artist, song) }
  let(:doc) {Nokogiri::HTML(URI.open('https://www.azlyrics.com/lyrics/imaginedragons/believer.html'))}

  describe 'Initialize' do
    it 'returns true if scraper is subclass of Scraper' do
      expect(scraper).to be_an_instance_of(Scraper)
    end
    it 'set artist as first argument of initialize' do
        expect(scraper.artist).to eq(artist)  
    end
    it 'set song as second argument of initialize' do
        expect(scraper.song).to eql(song) 
    end
  end

  describe '#format_words' do
    it 'returns a string without spaces and lowercased' do
      expect(scraper.format_words(artist)).to eql('kanyewest')
    end
    it 'returns false to a string without spaces and lowercased' do
        expect(scraper.format_words(artist)).not_to eql('kanye west')
      end
  end

  describe "#url_maker" do
      it 'returns full made url for scraper' do
        expect(scraper.url_maker).to eql('https://www.azlyrics.com/lyrics/kanyewest/throughthewire.html')  
      end
      it 'returns false for defective url for scraper' do
        expect(scraper.url_maker).not_to eql('https://www.azlyrics.com/lyrics/kanye west/through thewi re.html')  
      end
  end

  describe "#scrape" do
      it 'returns Nokogiri xml content' do
        expect(scraper.scrape().class).to eql(Nokogiri::XML::NodeSet) 
      end

  end
  
  
end
