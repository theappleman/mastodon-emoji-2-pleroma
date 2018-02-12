# Copmoji

Cop[y a Mastodon instance's custom e]moji [into Pleroma format]

## Build

> mix deps.get  
> mix escript.build

## Usage

> copmoji example.org <-m|-u>

### URL mode

> copmoji -u example.org

Pull the list of custom emoji from the Mastodon instance at "example.org".
From the list, pull out the "url" attribute of each item and print it.

This list can be passed to wget (-i mode, or with xargs) to download the emoji to a local folder.

> mkdir example.org  
> cd example.org  
> copmoji -u example.org | xargs --no-run-if-empty wget

### Mapping mode

> copmoji -m example.org

Pull the list of custom emoji from the Mastodon instance at "example.org".
From the list, pull the "shortcode" and the basename of the filename of the emoji image.

With this piece of information, compile the custom_emoji.txt entries suitable for pleroma.

> copmoji -m example.org >> custom_emoji.txt

## References

https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md#getting-current-instances-custom-emojis
https://hackernoon.com/elixir-console-application-with-json-parsing-lets-print-to-console-b701abf1cb14
https://git.pleroma.social/pleroma/pleroma/wikis/How%20to%20add%20custom%20emoji

