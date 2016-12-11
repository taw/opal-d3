module D3
  class TimeInterval
    include Native
    def initialize(native)
      raise unless native
      @native = native
    end

    alias_native :round
    alias_native :floor
    alias_native :ceil
    alias_native :offset
    alias_native :range
    alias_native :count

    def every(step)
      D3::TimeInterval.new(@native.JS.every(step))
    end

    def filter(&block)
      D3::TimeInterval.new(@native.JS.filter(block))
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

    alias_d3 :time_years, :timeYears
    alias_d3 :utc_years, :utcYears
    alias_d3 :time_milliseconds, :timeMilliseconds
    alias_d3 :utc_milliseconds, :utcMilliseconds
    alias_d3 :time_seconds, :timeSeconds
    alias_d3 :utc_seconds, :utcSeconds
    alias_d3 :time_minutes, :timeMinutes
    alias_d3 :utc_minutes, :utcMinutes
    alias_d3 :time_hours, :timeHours
    alias_d3 :utc_hours, :utcHours
    alias_d3 :time_days, :timeDays
    alias_d3 :utc_days, :utcDays
    alias_d3 :time_weeks, :timeWeeks
    alias_d3 :utc_weeks, :utcWeeks
    alias_d3 :time_sundays, :timeSundays
    alias_d3 :utc_sundays, :utcSundays
    alias_d3 :time_mondays, :timeMondays
    alias_d3 :utc_mondays, :utcMondays
    alias_d3 :time_tuesdays, :timeTuesdays
    alias_d3 :utc_tuesdays, :utcTuesdays
    alias_d3 :time_wednesdays, :timeWednesdays
    alias_d3 :utc_wednesdays, :utcWednesdays
    alias_d3 :time_thursdays, :timeThursdays
    alias_d3 :utc_thursdays, :utcThursdays
    alias_d3 :time_fridays, :timeFridays
    alias_d3 :utc_fridays, :utcFridays
    alias_d3 :time_saturdays, :timeSaturdays
    alias_d3 :utc_saturdays, :utcSaturdays
    alias_d3 :time_months, :timeMonths
    alias_d3 :utc_months, :utcMonths
  end
end
