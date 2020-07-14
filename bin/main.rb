require_relative '../lib/scraper.rb'

artist = ''
song = ''

loop do
  puts 'Enter Name of the artist'
  artist = gets.chomp

  puts 'Enter Name of the Song'

  song = gets.chomp

  break if !artist.empty? && !song.empty?
end

lyrics = Scraper.new(artist, song)

lyrics.scrape()