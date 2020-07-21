require_relative '../lib/scraper.rb'

artist = ''
song = ''

loop do
  puts 'Enter Name of the ARTIST or Exit or Quit to abort'
  artist = gets.chomp

  abort if artist =~ /(?:ex|qu)it/i

  puts 'Enter Name of the SONG or Exit to quit'

  song = gets.chomp

  abort if song =~ /(?:ex|qu)it/i

  break if !artist.empty? && !song.empty?

  puts "Provide name for SONG and ARTIST to quit the loop or type exit\r\n"
  puts '-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'
end

puts '----------------------------------------------'

lyrics = Scraper.new(artist, song)

result = lyrics.scraper

puts result
