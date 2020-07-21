require_relative '../lib/scraper.rb'

artist = ''
song = ''

loop do
  puts 'Enter Name of the artist or Exit or Quit to abort'
  artist = gets.chomp
  if artist.empty? || artist == ' '
    puts 'Please, do not leave artist input empty, Enter the Name of Artist'
    artist = gets.chomp
  end

  abort if artist =~ /(?:ex|qu)it/i

  puts 'Enter Name of the Song or Exit to quit'

  song = gets.chomp
  if song.empty?
    puts 'Please, do not leave song input empty, Enter the Name of the Song'
    song = gets.chomp
  end

  abort if song =~ /(?:ex|qu)it/i

  break if !artist.empty? && !song.empty?

  puts 'Provide name for song and artist to quit the loop'
end

puts '----------------------------------------------'

lyrics = Scraper.new(artist, song)

result = lyrics.scraper

puts result
