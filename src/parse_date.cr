require "time"
require "./format/*"

# This utility tries to brute force match a time/date against a hierarchy
# of possible formats in order to be able to broadly accept, and parse a
# wide range of date specifications.
#
# It iterates through a list for formats, attempting to match against
# each date specification in turn, until either a match is found or the
# list is exhausted. The current set of formats is:
#
# 1) Time::Format::YAML_DATE
# 2) Time::Format::ISO_8601_DATE_TIME
# 3) Time::Format::ISO_8601_DATE
# 4) Time::Format::ISO_8601_TIME
# 5) Time::Format::RFC_2822
# 6) Time::Format::RFC_3339
# 7) Time::Format::HTTP_DATE
# 8) ParseDate::Format::UsMil
class ParseDate
  VERSION = "0.1.0"

  DEFAULT_FORMATS = [
    Time::Format::YAML_DATE,
    Time::Format::ISO_8601_DATE_TIME,
    Time::Format::ISO_8601_DATE,
    Time::Format::ISO_8601_TIME,
    Time::Format::RFC_2822,
    Time::Format::RFC_3339,
    Time::Format::HTTP_DATE,
    ParseDate::Format::UsMil,
  ]

  # Parse a string into a Time.
  #
  # The string to parse is a mandatory argument. If a nil is received,
  # the method will return nil.
  #
  # If `fallback` is set to true (the default), then if the date can not
  # be parsed, it will attempt to convert slashes to dashes before trying
  # again.
  #
  # The `formats` parameter can be used to overide the default list of
  # formats to attempt to match. If omitted, the default set specified
  # above is used.
  def self.parse(string : String?, fallback : Bool = true, formats = DEFAULT_FORMATS) : Time?
    return nil if string.nil?

    dt : Time? = nil
    formats.each do |fmt|
      dt = if fmt.responds_to?(:parse?)
             fmt.parse?(string) rescue nil
           else
             fmt.parse(string) rescue nil
           end
      break unless dt.nil?
    end
    if dt.nil? && fallback
      new_string = string.gsub("/", "-") if string.strip.index("/").try &.> 0
      dt = parse(new_string, false) unless new_string.nil?
    end
    dt
  end
end
