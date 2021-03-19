# parsedate

![SplayTreeMap CI](https://img.shields.io/github/workflow/status/wyhaines/ParseDate.cr/ParseDate%20CI?style=for-the-badge&logo=GitHub)
[![GitHub release](https://img.shields.io/github/release/wyhaines/ParseDate.cr.svg?style=for-the-badge)](https://github.com/wyhaines/ParseDate.cr/releases)
![GitHub commits since latest release (by SemVer)](https://img.shields.io/github/commits-since/wyhaines/ParseDate.cr/latest?style=for-the-badge)

This utility tries to brute force match a time/date against a hierarchy of possible formats in order to be able to broadly accept, and parse a wide range of date specifications.

It iterates through a list for formats, attempting to match against each date specification in turn, until either a match is found or the list is exhausted. The current set of formats is:
  
1) Time::Format::YAML_DATE
2) Time::Format::ISO_8601_DATE_TIME
3) Time::Format::ISO_8601_DATE
4) Time::Format::ISO_8601_TIME
5) Time::Format::RFC_2822
6) Time::Format::RFC_3339
7) Time::Format::HTTP_DATE
8) ParseDate::Format::UsMil

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     parsedate:
       github: wyhaines/ParseDate.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "parse_date"
```

dt = ParseDate.parse("2020-07-20")
dt = ParseDate.parse("2008-04-17 08:55:11.842682 -06:00")

See the [spec file](spec/parse_date_spec.cr) for many examples of parseable dates.

## Development

This library is simple and inefficient in its operation. It would be nice to have an actual date parser that would intelligently attempt to figure out a date in order to produce a Time without
utilizing a brute force approach. Someday...

## Contributing

1. Fork it (<https://github.com/wyhaines/parsedate/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Kirk Haines](https://github.com/wyhaines) - creator and maintainer

![SplayTreeMap CI](https://img.shields.io/github/workflow/status/wyhaines/ParseDate.cr/Serf-Handler.cr%20CI?style=for-the-badge&logo=GitHub)
[![GitHub release](https://img.shields.io/github/release/wyhaines/ParseDate.cr.svg?style=for-the-badge)](https://github.com/wyhaines/ParseDate.cr/releases)
![GitHub commits since latest release (by SemVer)](https://img.shields.io/github/commits-since/wyhaines/ParseDate.cr/latest?style=for-the-badge)