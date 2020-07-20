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

puts '----------------------------------------------'

lyrics = Scraper.new(artist, song)

result = lyrics.scraper

puts result
