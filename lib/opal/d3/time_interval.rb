require "time"
require "native"

module D3
  class TimeInterval
    def initialize(native)
      raise unless native
      @native = native
    end

    def round(date)
      @native.JS.round(date)
    end

    def floor(date)
      @native.JS.floor(date)
    end

    def ceil(date)
      @native.JS.ceil(date)
    end
  end

  class << self
    def time_year; D3::TimeInterval.new(`window.d3.timeYear`); end
    def utc_year; D3::TimeInterval.new(`window.d3.utcYear`); end
    def time_month; D3::TimeInterval.new(`window.d3.timeMonth`); end
    def utc_month; D3::TimeInterval.new(`window.d3.utcMonth`); end
    def time_week; D3::TimeInterval.new(`window.d3.timeWeek`); end
    def utc_week; D3::TimeInterval.new(`window.d3.utcWeek`); end
    def time_monday; D3::TimeInterval.new(`window.d3.timeMonday`); end
    def utc_monday; D3::TimeInterval.new(`window.d3.utcMonday`); end
    def time_tuesday; D3::TimeInterval.new(`window.d3.timeTuesday`); end
    def utc_tuesday; D3::TimeInterval.new(`window.d3.utcTuesday`); end
    def time_wednesday; D3::TimeInterval.new(`window.d3.timeWednesday`); end
    def utc_wednesday; D3::TimeInterval.new(`window.d3.utcWednesday`); end
    def time_thursday; D3::TimeInterval.new(`window.d3.timeThursday`); end
    def utc_thursday; D3::TimeInterval.new(`window.d3.utcThursday`); end
    def time_friday; D3::TimeInterval.new(`window.d3.timeFriday`); end
    def utc_friday; D3::TimeInterval.new(`window.d3.utcFriday`); end
    def time_saturday; D3::TimeInterval.new(`window.d3.timeSaturday`); end
    def utc_saturday; D3::TimeInterval.new(`window.d3.utcSaturday`); end
    def time_sunday; D3::TimeInterval.new(`window.d3.timeSunday`); end
    def utc_sunday; D3::TimeInterval.new(`window.d3.utcSunday`); end
    def time_day; D3::TimeInterval.new(`window.d3.timeDay`); end
    def utc_day; D3::TimeInterval.new(`window.d3.utcDay`); end
    def time_hour; D3::TimeInterval.new(`window.d3.timeHour`); end
    def utc_hour; D3::TimeInterval.new(`window.d3.utcHour`); end
    def time_minute; D3::TimeInterval.new(`window.d3.timeMinute`); end
    def utc_minute; D3::TimeInterval.new(`window.d3.utcMinute`); end
    def time_second; D3::TimeInterval.new(`window.d3.timeSecond`); end
    def utc_second; D3::TimeInterval.new(`window.d3.utcSecond`); end
    def time_millisecond; D3::TimeInterval.new(`window.d3.timeMillisecond`); end
    def utc_millisecond; D3::TimeInterval.new(`window.d3.utcMillisecond`); end
  end
end
