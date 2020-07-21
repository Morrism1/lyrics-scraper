# lyrics-scraper 🎹🎻

> Ruby Capstone Project of Microverse, which students have to complete a real-world-like project within 72 hours according to [this project specification](https://www.notion.so/Build-your-own-scraper-f54eaca54d8a4d758a5f0141468127a8)

I decided to scrape Lyrics from `azlyrics.com`. I do love music much.
I liked the idea that I can write the name and the title of the song for internationally recognized Artists and be able to find them.

![Demo](https://user-images.githubusercontent.com/46853433/87832153-9a1cb680-c885-11ea-8ba8-e0ac06f5d9f4.png)

## Built With

- Ruby
- Nokogiri gem
- Rspec

## Project Structure

```
├── README.md
├── bin
│   └── main.rb
└── lib
    └── scraper.rb
    
└── rspec
    └── scraper_spec.rb
    └── spec_helper.rb
```

## Deployment

1) Git clone this repo and cd the to the `lyrics-scraper` directory.
2) Run `bundle install` in the command line to install Nokogiri and Rspec.
3) Run `ruby bin/main.rb`.
4) Input prompt will be present in separate lines. Press enter the` name of the artist` followed by `song` to begin the search.
5) Voila! Lyrics will be displayed in the terminal or Receive an error if it does not exist. 🎶🎵🎼

## Run tests

1) Git clone this repo and cd the to the `lyrics-scraper` directory.
2) Install RSpec with `gem install rspec`.
3) Run `rspec` in Command-Line.
4) `12 examples, 0 failures` will be shown on the screen.

👨 **Maurice Murangwa**

- Github: [@Morrism1](https://github.com/Morrism1)
- Twitter: [@MorrisMontana0](https://twitter.com/MurangwaMorris)
- Linkedin: [Maurice Murangwa](https://www.linkedin.com/in/murangwa-maurice-769549140/)

## Acknowledgments

- Microverse
- Nokogiri gem
- Azlyrics
- Open URI

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Support this project with a ⭐️ and let us know if you would like to become a contributor!
